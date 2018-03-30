class CartsController < ApplicationController
		before_action :get_items



  # POST /checkouts
  def create

	  @amount = number_to_currency(current_order.subtotal, :locale => :ir)
	
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )
	
	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Good Vibrations Customer',
	  )
	
	  rescue Stripe::CardError => e
	    flash[:error] = e.message
	    redirect_to new_checkouts_path
	  end    

	def show
	end
	
	private

	def get_items
		@order_items = current_order.order_items
	end

end
