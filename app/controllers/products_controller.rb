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
		input_stock_num = params[:stock_number]

		@product = Product.create(name:input_name , price:input_price , image:input_image , description:input_desc, stock_number:input_stock_num)
		
		flash[:success] = "Product Created!"
		redirect_to "/products/#{@product.id}"
	end

	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def update
		input_name = params[:name]
		input_price = params[:price]
		input_image = params[:image]
		input_desc = params[:description]
		input_stock_num = params[:stock_number]

		product = Product.find_by(id: params[:id])
		@product = product.update(name:input_name , price:input_price , image:input_image , description:input_desc, stock_number:input_stock_num)
		#@product.save

		flash[:info] = "Product updated successfully!"
		redirect_to "/products/#{product.id}"
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		flash[:danger] = "Product Deleted"
		redirect_to '/products'
	end

	# def search_results
	# 	@keyword = "%#{params[:keywords]}%"
	# 	@products = Product.where("name LIKE ? OR description LIKE ?", @keyword, @keyword)
	# end
end







