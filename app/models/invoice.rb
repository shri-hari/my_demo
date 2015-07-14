class Invoice < ActiveRecord::Base
	self.primary_key = "invoice_number"

	has_many :items, :dependent => :destroy
end
