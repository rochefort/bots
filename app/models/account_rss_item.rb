class AccountRssItem < ApplicationRecord
  belongs_to :account
  belongs_to :rss_item
end
