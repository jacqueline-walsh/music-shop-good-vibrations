class RemoveColumnsFromOrders < ActiveRecord::Migration[5.1]
  def change
    	#remove_column :orders, :listing_id, :integer
    	remove_column :orders, :seller_id, :integer
    end
  end
end
