class Product < ApplicationRecord
  has_many :product_reviews
  has_many :product_tweets
end
