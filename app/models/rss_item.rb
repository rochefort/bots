class RssItem < ApplicationRecord
  has_many :account_rss_items
  has_many :accounts, through: :account_rss_items

  belongs_to :rss_site

  enum status: { created: 0, classfied: 1 }
end
