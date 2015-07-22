class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do  |t|
      t.date :invoice_date, :default => Date.today
      t.string :invoice_status, :default => "Due"
      t.float :amount


      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
