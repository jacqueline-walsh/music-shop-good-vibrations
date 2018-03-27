class CartsController < ApplicationController
		before_action :get_items
	
	def show
	end

	def thank_you
	end

	private

	def get_items
		@order_items = current_order.order_items
	end

end
