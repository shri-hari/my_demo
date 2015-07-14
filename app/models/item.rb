class Item < ActiveRecord::Base

	belongs_to :invoice, :foreign_key => "invoice_number", :class_name => "Invoice"
	belongs_to :product
end
