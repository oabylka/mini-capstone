class OrdersController < ApplicationController
	def create
		input_quantity = params[:quantity]
		input_user_id = current_user.id
		input_product_id = params[:product_id]
		@order = Order.new(quantity:input_quantity, user_id: input_user_id, product_id: input_product_id)
		@product = Product.find_by(id: @order.product_id)

		@order.calculate_subtotal(@product.price, input_quantity.to_i)
		@order.calculate_tax
		@order.calculate_total

		@order.save
		redirect_to "/orders/#{@order.id}"
		#editint number in stock
		@product.stock_number = @product.stock_number-input_quantity.to_i
		@product.save
	end

	def show
		@order = Order.find_by(id: params[:id])
	end
end

