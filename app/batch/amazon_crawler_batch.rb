require "amazon/ecs"
require "mechanize"
require "retryable"

class AmazonCrawlerBatch
  MAX_ITEM_PAGE = 10 # APIの仕様上10まで
  MAX_RETRY_COUNT = 3

  def initialize
    c = Rails.application.secrets.aws_config
    Amazon::Ecs.configure do |options|
      options[:AWS_access_key_id] = c["AWS_access_key_id"]
      options[:AWS_secret_key] = c["AWS_secret_key"]
      options[:associate_tag] = c["associate_tag"]
      options[:search_index] = "Books"
      options[:country] = "jp"
    end

    @agent = Mechanize.new
    @agent.user_agent_alias = "Windows Mozilla"
  end

  def run(keyword)
    search_amazon(keyword).each do |item|
      save_product(item)
      crawl_product(item.get("ASIN"))
    end
  end

  private
    def search_amazon(keyword, item_page = 1, result = [])
      return result if item_page > MAX_ITEM_PAGE
      options = {
        response_group: "Medium",
        sort: "salesrank",
        item_page: item_page
      }
      res = nil
      Retryable.retryable(on: [Amazon::RequestError], tries: 4, sleep: 4) do |retries, exception|
        res = Amazon::Ecs.item_search(keyword, options)
        Rails.logger.error "try #{retries} failed with exception: #{exception}" if retries > 0
      end
      result += res.items
      return result if item_page >= res.total_pages
      search_amazon(keyword, item_page + 1, result)
    end

    def save_product(item)
      attributes = item.get_element("ItemAttributes")
      binding = attributes.get("Binding")
      product = Product.find_or_initialize_by(asin: item.get("ASIN"))
      # puts "#{item.get("ASIN")}: #{attributes.get("PublicationDate")}"
      product.update(
        title: attributes.get("Title"),
        authors: attributes.get_array("Author").join(","),
        binding: binding,
        format: attributes.get("Format"),
        ean: attributes.get("EAN"),
        isbn: attributes.get("ISBN"),
        label: attributes.get("Label"),
        number_of_pages: attributes.get("NumberOfPages"),
        product_group: attributes.get("ProductGroup"),
        publication_date: attributes.get("PublicationDate"),
        manufacturer: attributes.get("Manufacturer"),
        publisher: attributes.get("Publisher"),
        studio: attributes.get("Studio"),
        is_adult_product: attributes.get("IsAdultProduct") == "1",
        is_kindle: binding.downcase.include?("kindle"),
        price: item.get("OfferSummary/LowestNewPrice/Amount"),
        currency: item.get("OfferSummary/LowestNewPrice/CurrencyCode")
      )
    end

    def crawl_product(asin)
      url = PRODUCT_URL + asin
      page = nil
      Retryable.retryable(tries: 3, sleep: 3) do |retries, exception|
        page = @agent.get(url)
        Rails.logger.error "try #{retries}, code: #{page&.code} failed with exception: #{exception}" unless page&.code == "200"
      end
      return unless page.title

      reviews = page.search("#revMHRL div.a-section.celwidget")
      Product.transaction do
        product = Product.where(asin: asin).first
        return unless product
        score_str = page.search(".a-icon.a-icon-star")[0]&.text()
        product.update!(score: extract_score(score_str)) if score_str

        reviews.each do |review|
          row = review.search("div.a-row")
          reviewer_elm = review.search("span.a-size-normal a.noTextDecoration")[0]
          product_review = product.product_reviews.find_or_initialize_by(
            reviewer: reviewer_elm.text,
            reviewer_id: reviewer_elm.attribute("href").value.match(%r{profile/(.+?)/}).to_a[1],
            title: row.search(".a-size-base.a-text-bold").text()
          )
          product_review.update!(
            description: review.search("div[id^=revData-] .a-section").text.strip,
            review_date: row.search(">.a-color-secondary>.a-color-secondary").text.tr("投稿日", "").strip.to_date,
            score: extract_score(row.search(".a-icon.a-icon-star").text())
          )
        end
      end
    rescue => e
      Rails.logger.error "Error Occured (asin: #{asin}) #{e}"
      Rails.logger.error e.backtrace
    end

    def extract_score(str)
      score = str.split[1]
      score = score.to_f if score
      score
    end
end
