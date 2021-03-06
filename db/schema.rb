# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150716095923) do

  create_table "invoices", :force => true do |t|
    t.date     "invoice_date",   :default => '2015-07-20'
    t.string   "invoice_status", :default => "Due"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "biller"
    t.string   "customer"
  end

  create_table "items", :force => true do |t|
    t.integer  "quantity"
    t.float    "price"
    t.integer  "product_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.string   "product_description"
    t.float    "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roles"
    t.boolean  "admin",             :default => false
    t.boolean  "enable",            :default => false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
  end

end
