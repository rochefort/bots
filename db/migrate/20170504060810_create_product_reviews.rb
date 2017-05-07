class CreateProductReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :product_reviews do |t|
      t.string :reviewer, null: false
      t.string :reviewer_id, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.date :review_date, null: false
      t.float :score, null: false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
