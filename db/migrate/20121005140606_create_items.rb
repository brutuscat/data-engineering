class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.decimal :price, :precision => 9, :scale => 2

      t.timestamps
    end
  end
end
