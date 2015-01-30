class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :City, :string
    add_column :users, :Address, :string
    add_column :users, :Phone, :string
  end
end
