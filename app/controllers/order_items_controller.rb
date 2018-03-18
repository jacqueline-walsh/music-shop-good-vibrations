class OrderItemsController < ApplicationController
  before_action :authenticate_user! 

  def purchases
    @orders = @order.order_items.all.where(buyer: current_user).order("created_at DESC")
  end

  def create      
    @order = current_order
    @order.buyer_id = current_user.id
    @order.order_items.build(order_item_params)       
    @order.save       
    session[:order_id] = @order.id
  end

  def update
	 @order = current_order
	 @order_item = @order.order_items.find(params[:id])
	 @order_item.update_attributes(order_item_params)
	 @order_items = @order.order_items
  end

  def destroy
	 @order = current_order
	 @order_item = @order.order_items.find(params[:id])
	 @order_item.destroy
	 @order_items = @order.order_items
  end

private
  def order_item_params               
     params.require(:order_item).permit(:listing_id, :quantity, :seller_id)
  end
end
