class CreateFavoriteItems < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_items do |t|
      t.string :guid
      t.references :account, foreign_key: true

      t.timestamps
    end
    add_index :favorite_items, :guid, unique: true
  end
end
