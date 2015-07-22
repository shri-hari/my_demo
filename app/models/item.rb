class Item < ActiveRecord::Base

	belongs_to :invoice
	belongs_to :product
	attr_accessor :unit_price
	attr_accessible :unit_price, :product_id,:quantity, :price
end
