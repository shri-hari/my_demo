class UpdateInvoice < ActiveRecord::Migration
  def self.up
  	add_column :invoices,:biller,:string
  	add_column :invoices,:customer,:string
  end

  def self.down
    remove_column :invoices,:biller,:string
  	remove_column :invoices,:customer,:string
  end
end
