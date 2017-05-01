class CreateRssSites < ActiveRecord::Migration[5.0]
  def change
    create_table :rss_sites do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :rss_sites, :title, unique: true
    add_index :rss_sites, :url, unique: true
  end
end
