require "twitter"

module Batch
  class RssTwitter
    MAX_TWEET_SIZE = 140
    # url形式だと23bytesとして扱われる。
    TWEET_URL_SIZE = 23

    def run
      Account.all.each do |account|
        client = generate_twitter_client(account)
        relation = account.account_rss_items.where("account_rss_items.tweeted_date": nil).order(:id).first
        return unless relation
        msg = generate_tweet(relation.rss_item)
        tweet(client, msg)  # TODO: Tweet用のclassに分ける
        relation.update(tweeted_date: Time.now)
      end
    end

    private
      def generate_twitter_client(account)
        Twitter::REST::Client.new do |c|
          c.consumer_key        = account.consumer_key
          c.consumer_secret     = account.consumer_secret
          c.access_token        = account.access_token
          c.access_token_secret = account.access_token_secret
        end
      end

      def generate_tweet(rss_item)
        r = rss_item
        title = "[#{r.rss_site.title}]#{r.title}"
        # title, desc, link の改行数
        line_feed_number = 2
        desc_size = MAX_TWEET_SIZE - TWEET_URL_SIZE - title.size - line_feed_number
        desc = "#{r.description}\n".truncate(desc_size)
        "#{title}\n#{desc}\n#{rss_item.link}"
      end

      def tweet(client, msg)
        client.update(msg)
      rescue => e
        p e
        # p e if @debug
      end
  end
end

if $0 == __FILE__
  Batch::RssTwitter.new.run
end
