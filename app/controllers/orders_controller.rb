class OrdersController < ApplicationController
	before_action :authenticate_user!
	
	def create

		@products = CartedProduct.where(user_id: current_user.id, status:"carted")
		@order = Order.new(user_id: current_user.id)

		@products.each do |prod|
			subtotal = 0
			#product_id = prod.product_id
			#product = Product.find_by(id: product_id)
			price = prod.product.price
			subtotal = @order.calculate_subtotal(price, prod.quantity) + subtotal
		end

		@order.calculate_tax
		@order.calculate_total

		if @order.save
			@products.each do |x|
				x.update(status: "purchased", order_id: @order.id)
			end
		end

		redirect_to "/orders/#{@order.id}"

		#editing number in stock
		#@product.stock_number = @product.stock_number-input_quantity.to_i
		#@product.save
	end

	def show
		@order = Order.find_by(id: params[:id])
	end

end

