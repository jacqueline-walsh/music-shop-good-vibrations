class AddSellerIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :seller_id, :integer
  end
end
