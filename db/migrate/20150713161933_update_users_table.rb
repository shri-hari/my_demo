class UpdateUsersTable < ActiveRecord::Migration
  def self.up
  	add_column :users,:roles,:string
  	add_column :users,:admin?,:boolean,:default => false
  	add_column :users,:enable?,:boolean,:default => false
  	add_column :users,:address,:string
  	add_column :users,:city,:string
  	add_column :users,:state,:string
  	add_column :users,:country,:string
  	add_column :users,:zip,:string

  end

  def self.down
  	remove_column :users,:roles,:string
  	remove_column :users,:admin?,:boolean,:default => false
  	remove_column :users,:enable?,:boolean,:default => false
  	remove_column :users,:address,:string
  	remove_column :users,:city,:string
  	remove_column :users,:state,:string
  	remove_column :users,:country,:string
  	remove_column :users,:zip,:string
  end
end
