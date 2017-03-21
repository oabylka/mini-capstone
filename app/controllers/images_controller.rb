class ImagesController < ApplicationController
	def new
		@product = Product.find_by(id: params[:product_id])
	end

	def create
		@product = Product.find_by(id: params[:product_id])
		input_name = params[:name]

		Image.create(name:input_name, product_id:@product.id)

		redirect_to "/products/#{@product_id}"
	end

	def show
		@images = Image.all
	end


	
end
