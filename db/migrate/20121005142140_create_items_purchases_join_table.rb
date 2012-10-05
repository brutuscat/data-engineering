class CreateItemsPurchasesJoinTable < ActiveRecord::Migration
  def change
    create_table :items_purchases, :id => false do |t|
      t.integer :item_id
      t.integer :purchase_id
    end
    add_index :items_purchases, :item_id
    add_index :items_purchases, :purchase_id
  end
end
