class AddBuyerIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :buyer_id, :integer
  end
end
