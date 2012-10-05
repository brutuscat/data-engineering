class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :purchaser
      t.references :merchant

      t.timestamps
    end
    add_index :purchases, :purchaser_id
    add_index :purchases, :merchant_id
  end
end
