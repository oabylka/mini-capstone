class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product, optional: true

	def calculate_subtotal(price, quantity)
		self.subtotal = price*quantity
	end

	def calculate_tax
		self.tax = self.subtotal*0.0875
	end
	def calculate_total
		self.total = self.subtotal+tax
	end
end
