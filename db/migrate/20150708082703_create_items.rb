class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :quantity
      t.float :price
      t.integer :product_id
      t.string :invoice_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
