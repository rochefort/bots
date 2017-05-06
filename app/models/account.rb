class Account < ApplicationRecord
  attr_encrypted :consumer_key, key: BOTS_ENCRYPTED_KEY
  attr_encrypted :consumer_secret, key: BOTS_ENCRYPTED_KEY
  attr_encrypted :access_token, key: BOTS_ENCRYPTED_KEY
  attr_encrypted :access_token_secret, key: BOTS_ENCRYPTED_KEY

  has_many :account_rss_items
  has_many :rss_items, through: :account_rss_items

  def about_myself?(*words)
    keywords = self.keywords&.split("\n") || []
    keywords.any? do |keyword|
      words.join.include?(keyword)
    end
  end
end
