require "rss"

class FavTwitterBatch
  USER_RSS = "https://queryfeed.net/twitter?title-type=user-name-both&geocode=&q=from%3A"

  def run
    Account.all.each do |account|
      ids = account.favorites.where(status: :active).pluck(:favorite_account_id)
      ids += account.players.where("twitter_account is not null").pluck(:twitter_account)
      client = TwitterClient.new(account)
      favs_and_retweets(client, ids)
    end
  end

  private
    def favs_and_retweets(client, ids)
      guids = []
      ids.each do |user|
        rss_url = "#{USER_RSS}#{user}"
        rss = RSS::Parser.parse(rss_url)
        rss.items.each do |item|
          guid = item.guid.content.match(/\d+$/).to_a[0]
          guids << guid if guid
        end
      end
      guids.sort.reverse.each { |guid| client.fav_and_retweet(guid) }
    end
end
