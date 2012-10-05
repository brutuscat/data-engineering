class Purchaser < ActiveRecord::Base
  has_many :purchases
  attr_accessible :name
end
