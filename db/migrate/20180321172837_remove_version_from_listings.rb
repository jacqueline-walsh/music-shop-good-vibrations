class RemoveVersionFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :version, :string
  end
end
