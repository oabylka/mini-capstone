class CartedProductsController < ApplicationController
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
			flash[:danger] = "Couldn't Add Product to Cart!"
			redirect_to "/cart/#{input_product_id}"
		end


	end

	def index
		#@carted_products = CartedProduct.find_by(id: params[:product_id])
		@carted_products = CartedProduct.where(user_id: current_user.id, status:"carted")

		#@carted_products = current_user.carted_products.where(status: "carted")
	end


	def destroy
		
		@carted_product = CartedProduct.find_by(id: params[:id])
		@carted_product.status = "removed"
		@carted_product.save
		
		flash[:success] = "Product removed!"
		redirect_to "/cart"
		
	end
end

