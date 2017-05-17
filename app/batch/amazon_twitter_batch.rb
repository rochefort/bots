class AmazonTwitterBatch
  class << self
    def product_tweet(account_id)
      # TODO: consider SQL
      # - 直近N日間つぶやいていない商品を抽出
      # - 対象商品の選定（keyword?）
      #
      # 別件やけど、crawl時にkeyword入れた方がいいか？
      product = Product.where.not(binding: "ペーパーバック").first
      msg = generate_product_message(product)
      puts msg
      # client = TwitterClient.new(account)
      # client.tweet(msg)
    end

    private
      def generate_product_message(product)
        [
          "今日のおすすめ本\n",
          "#{product.title} #{product.authors}",
          "★: #{product.score}",
          PRODUCT_URL + product.asin
        ].join("\n")
      end
  end
end
