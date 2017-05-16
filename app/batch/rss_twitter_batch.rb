class RssTwitterBatch
  def run
    Account.all.each do |account|
      client = TwitterClient.new(account)
      relation = account.account_rss_items.where("account_rss_items.tweeted_date": nil).order(:id).first
      return unless relation
      msg = generate_tweet(relation.rss_item)
      client.tweet(msg)
      relation.update(tweeted_date: Time.now)
    end
  end

  private
    def generate_tweet(rss_item)
      r = rss_item
      title = "[#{r.rss_site.title}]#{r.title}"
      # title, desc, link の改行数
      line_feed_number = 2
      desc_size = TWEET_MSX_SIZE - TWEET_URL_SIZE - title.size - line_feed_number
      desc = "#{r.description}\n".truncate(desc_size)
      "#{title}\n#{desc}\n#{rss_item.link}"
    end
end
