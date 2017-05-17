class CreateProductTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :product_tweets do |t|
      t.references :account, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
