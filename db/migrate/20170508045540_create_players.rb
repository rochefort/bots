class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :name_alias
      t.string :position
      t.integer :number
      t.string :birth_date
      t.string :height
      t.string :weight
      t.string :hometown
      t.string :former_team
      t.string :twitter_account
      t.string :instagram_account
      t.string :blog_url
      t.string :blog_rss_url
      t.string :chant
      t.integer :status, default: 0
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
