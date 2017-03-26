class ProductsController < ApplicationController
	before_action :authenticate_user!

	def index
		sort = params[:sort]
		sort_order = params[:sort_order]
		discount_items = params[:discount_items]
		category_id = params[:category_id]


		if category_id
			@category = Category.find_by(id: category_id)
			@products = @category.products
		else
			@products = Product.all
		end

		# if discount_items
		# 	@products = Product.where("price < ?", 2)
		# elsif sort && sort_order
		# 	@products = Product.all.order(sort => sort_order)
		# else
		# 	@products = Product.all
		# end
	end

	def new
		
	end

	def show
		if params[:id] == "random"
			products = Product.all
			@product = products.sample
		else
			product_id = params[:id]
			@product = Product.find_by(id: product_id)
		end
	end

	def create
		input_name = params[:name]
		input_price = params[:price]
		input_image = params[:image]
		input_desc = params[:description]
		input_stock_num = params[:stock_number]
		input_supplier = params[:supplier_id]

		@product = Product.create(name:input_name , price:input_price , image:input_image , description:input_desc, 
			stock_number:input_stock_num, supplier_id:input_supplier)
		
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
		input_desc = params[:description]
		input_stock_num = params[:stock_number]
		input_supplier = params[:supplier_id]

		product = Product.find_by(id: params[:id])
		@product = product.update(name:input_name , price:input_price, description:input_desc, 
			stock_number:input_stock_num,supplier_id:input_supplier)
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

	def search
		@keyword = "%#{params[:keywords]}%"
		@product = Product.where("name ILIKE ? OR description ILIKE ?", @keyword, @keyword)
		render :index
	end
end







