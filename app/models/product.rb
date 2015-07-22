class Product < ActiveRecord::Base
	has_many :items
	validates_presence_of :product_name,:product_description,:unit_price
	validates_numericality_of :unit_price,:greater_than_or_equal => 0
end	
