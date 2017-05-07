class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :note
      t.string :associate_tag
      t.integer :status, default: 0
      t.string :keywords
      t.string :encrypted_consumer_key
      t.string :encrypted_consumer_key_iv
      t.string :encrypted_consumer_secret
      t.string :encrypted_consumer_secret_iv
      t.string :encrypted_access_token
      t.string :encrypted_access_token_iv
      t.string :encrypted_access_token_secret
      t.string :encrypted_access_token_secret_iv

      t.timestamps
    end
  end
end
