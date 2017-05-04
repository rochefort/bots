class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :asin, null: false
      t.string :title, null: false
      t.string :authors
      t.string :binding
      t.string :format
      t.string :ean
      t.string :isbn
      t.string :label
      t.string :number_of_pages
      t.string :product_group
      t.date :publication_date
      t.string :manufacturer
      t.string :publisher
      t.string :studio
      t.boolean :is_adult_product, default: false
      t.boolean :is_kindle, default: false
      t.integer :price
      t.string :currency
      t.float :score

      t.timestamps
    end
    add_index :products, :asin, unique: true
  end
end
