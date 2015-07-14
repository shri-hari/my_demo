class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices, {:id => false} do  |t|
      t.string :invoice_number, :limit => 10
      t.date :invoice_date, :default => Date.today
      t.string :invoice_status, :default => "Due"
      t.float :amount


      t.timestamps
    end
    execute "ALTER TABLE invoices ADD PRIMARY KEY (invoice_number);"
  end

  def self.down
    drop_table :invoices
  end
end
