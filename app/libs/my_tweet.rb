require "twitter"

class MyTweet
  def initialize(account)
    @client = Twitter::REST::Client.new do |c|
      c.consumer_key        = account.consumer_key
      c.consumer_secret     = account.consumer_secret
      c.access_token        = account.access_token
      c.access_token_secret = account.access_token_secret
    end
  end

  def tweet(msg)
    @client.update(msg)
  rescue => e
    Rails.logger.error e
    Rails.logger.error e.backtrace
  ensure
    sleep 1
  end
  end
end
