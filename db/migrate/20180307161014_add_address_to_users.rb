class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :street, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
    add_column :users, :country, :string
  end
end
