class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.string :favorite_account_id
      t.string :status, default: 0
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
