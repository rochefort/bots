require "rss"

module Batch
  class RssCrawler
    include ActionView::Helpers::SanitizeHelper
    def run
      RssSite.all.each do |site|
        # SoccorKing の RSSがinvalidであるため、validationなしでparseを行う
        rss = RSS::Parser.parse(site.url, false)
        rss.items.each do |item|
          next if RssItem.find_by(link: item.link)
          RssItem.create!(
            link: item.link,
            title: item.title,
            pub_date: item.date.strftime("%Y-%m-%d %H:%M:%S"),
            description: strip_tags(item.description)&.gsub(/\A　*/, ""),
            guid: item&.guid&.content,
            rss_site: site
          )
        end
      end
    end
  end
end

if $0 == __FILE__
  Batch::RssCrawler.new.run
end
