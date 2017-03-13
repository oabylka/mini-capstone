class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		
	end

	def show
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def create
		input_name = params[:name]
		input_price = params[:price]
		input_image = params[:image]
		input_desc = params[:description]

		@product = Product.create(name:input_name , price:input_price , image:input_image , description:input_desc)
	end

	def update
		input_name = params[:name]
		input_price = params[:price]
		input_image = params[:image]
		input_desc = params[:description]

		product = Product.find_by(id: params[:id])
		@product = product.update(name:input_name , price:input_price , image:input_image , description:input_desc)
		#@product.save

		redirect_to "/products/#{product.id}"
	end

	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to '/products'
	end

	def search_results
		@products = Product.where("name LIKE '%#{params[:keywords]}%'")
	end
end







