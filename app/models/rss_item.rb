class RssItem < ApplicationRecord
  has_many :account_rss_items
  has_many :accounts, through: :account_rss_items

  belongs_to :rss_site
end
