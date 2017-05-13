class AddColumnToRssSite < ActiveRecord::Migration[5.0]
  def change
    add_column :rss_sites, :ignore_keywords, :string
  end
end
