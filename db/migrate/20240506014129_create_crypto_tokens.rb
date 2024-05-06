class CreateCryptoTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :crypto_tokens do |t|
      t.string :ticker
      t.string :protocol

      t.timestamps
    end
  end
end
