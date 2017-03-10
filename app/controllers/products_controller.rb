class ProductsController < ApplicationController
	def view_products
		@products = Product.all
	end

	def new_product_form
		
	end

	def new_product
		input_name = params[:name]
		input_price = params[:price]
		input_image = params[:image]
		input_desc = params[:description]

		@product = Product.create(name:input_name , price:input_price , image:input_image , description:input_desc)
	end
end
