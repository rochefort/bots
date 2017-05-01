class CreateRssItems < ActiveRecord::Migration[5.0]
  def change
    create_table :rss_items do |t|
      t.string :title
      t.datetime :pub_date
      t.string :description
      t.string :link
      t.string :guid
      t.datetime :tweeted_date
      t.references :rss_site, foreign_key: true

      t.timestamps
    end
    add_index :rss_items, :link, unique: true
  end
end
