class CreateAccountRssItems < ActiveRecord::Migration[5.0]
  def change
    create_table :account_rss_items do |t|
      t.references :account, foreign_key: true, null: false
      t.references :rss_item, foreign_key: true, null: false
      t.datetime :tweeted_date

      t.timestamps
    end
    add_index :account_rss_items, [:account, :rss_item], unique: true
  end
end
