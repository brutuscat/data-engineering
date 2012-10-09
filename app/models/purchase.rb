class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant
  has_and_belongs_to_many :items
  # attr_accessible :title, :body

  def total
    items.reduce(0){ |total, item| total + item.price } rescue 0
  end

  def self.import(*args)
    purchaser_name, item_description, item_price, quantity, merchant_address, merchant_name = args
    Purchase.create do |purchase|
      purchase.purchaser = Purchaser.where(:name => purchaser_name).first_or_create
      item = Item.create(:description => item_description, :price => item_price.to_f)
      quantity.to_i.times{ purchase.items << item }
      purchase.merchant = Merchant.where(:address => merchant_address, :name => merchant_name).first_or_create
    end
  end
end
