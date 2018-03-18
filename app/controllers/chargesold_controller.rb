class ChargesController < ApplicationController
  before_action :authenticate_user! 

def new
end

def create
  @amount = (@listing.price * 100).floor,

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

	rescue Stripe::CardError => e
  	flash[:error] = e.message
  	redirect_to charge_path
	end
end
