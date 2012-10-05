class Item < ActiveRecord::Base
  has_and_belongs_to_many :purchases
  attr_accessible :description, :price
end
