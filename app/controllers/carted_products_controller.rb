class CartedProductsController < ApplicationController
	before_action :authenticate_user!

	def create

		input_quantity = params[:quantity]
		input_product_id = params[:product_id]
		input_user_id = current_user.id
		status_id = "carted"

		@cart = CartedProduct.create(quantity:input_quantity, product_id:input_product_id, user_id:input_user_id, status:status_id)
		
		if @cart.save
			flash[:success] = "Product Added to Cart!"
			#redirect_to "/cart/#{input_product_id}"
			redirect_to "/products"
			#redirect_to "/cart/#{@cart.id}"
		else
			if @cart.errors.messages[:quantity].empty?
				flash[:danger] = "Product couldn't be added to cart!"
				#redirect_to "/cart/#{input_product_id}"
			else
				flash[:danger] = "Product couldn't be added to cart! Must enter quantity more than 0"
			end
		end
	end

	def index
		@carted_products = CartedProduct.where(user_id: current_user.id, status:"carted")

		# if @carted_product.save
		# 	flash[:success] = "Product added to cart"
		# 	@carted_products = CartedProduct.where(user_id: current_user.id, status:"carted")
		# else
		# 	flash[:danger] = "Product couldn't be added to cart! Please add a valid quantity"
		# end
	end


	def destroy
		
		@carted_product = CartedProduct.find_by(id: params[:id])
		@carted_product.status = "removed"
		@carted_product.save
		
		flash[:success] = "Product removed!"
		redirect_to "/cart"
		
	end
end

