module Batch
  class RssClassification
    def run
      RssItem.created.order("pub_date, title").each do |rss_item|
        Account.all.each do |account|
          relate_item(account, rss_item) if account.about_myself?(rss_item.title, rss_item.description)
        end
        rss_item.classfied!
      end
    end

    private
      def relate_item(account, rss_item)
        account.rss_items << rss_item
      rescue ActiveRecord::RecordNotUnique => e
        # do nothing
      end
  end
end

if $0 == __FILE__
  Batch::RssClassification.new.run
end
