class OrderController < ApplicationController
  before_action :authenticate_user! 

def sales
  @orders = Order.all.where(seller: current_user).order("created_at DESC")
end

def purchases
  @orders = Order.all.where(buyer: current_user).order("created_at DESC")
end

 def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id

    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user

    @order.listing_id = @listing.id 
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    @order_item = @order.order_items.new(order_item_params)
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
      params.require(:order_item).permit(:listing_id, :quantity)
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
      end
    end
end