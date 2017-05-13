class RssSite < ApplicationRecord
  has_many :rss_items

  def include_ignore_keywords?(*words)
    ignore_keywords = self.ignore_keywords&.split || []
    ignore_keywords.any? do |keyword|
      words.join.include?(keyword)
    end
  end
end
