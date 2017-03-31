class Product < ApplicationRecord
	belongs_to :supplier
	has_many :users
	has_many :images
	has_many :categorized_products
	has_many :categories, through: :categorized_products
	has_many :orders, through: :carted_products
	has_many :carted_products

	validates :name, presence: true, numericality: false
	validates :price, presence: true, numericality: true
	validates :description, length: {maximum: 200}

	def sale_message(price)
		price = price
		if price < 2
			"Discount item!"
		else
			"Everyday Value!"
		end
	end

	def calculate_subtotal(price, quantity)
		self.subtotal = price*quantity
	end

	def tax(price)
		price = price
		(price*0.09).round(2)
	end

	def total(price, tax)
		price = price
		tax = tax
		price+tax
	end

	# def supplier
	# 	#Chef.find_by(id: chef_id)
	# 	Supplier.find_by(id: supplier_id)
	# end
end
