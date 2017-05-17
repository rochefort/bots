class ProductTweet < ApplicationRecord
  belongs_to :account
  belongs_to :product
end
