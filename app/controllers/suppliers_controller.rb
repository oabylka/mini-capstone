class SuppliersController < ApplicationController
before_action :authenticate_user!
	
	def index
		@suppliers = Supplier.all
	end
 
	def create
		input_name = params[:name]
		input_phone = params[:phone]
		input_email = params[:email]

		@supplier = Supplier.create(name:input_name, phone:input_phone, email:input_email)
	end

	def show
		supplier_id = params[:id]
		@supplier = Supplier.find_by(id: supplier_id)
	end

	def edit
		supplier_id = params[:id]
		@supplier = Supplier.find_by(id: supplier_id)
	end

	def update
		input_name = params[:name]
		input_phone = params[:phone]
		input_email = params[:email]

		supplier = Supplier.find_by(id: params[:id])
		@supplier = supplier.update(name:input_name, phone:input_phone, email:input_email)

		redirect_to "/suppliers/#{supplier.id}"
	end

	def new
	end

	def destroy
		@supplier = Supplier.find(params[:id])
		@supplier.destroy

		redirect_to "/suppliers"
	end
end
