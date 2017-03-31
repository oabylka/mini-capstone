class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carted_products
	has_many :carted_products

	validates :subtotal, presence: true
	validates :subtotal, numericality: true
	validates :subtotal, numericality: { greater_than: 0 }


	validates :tax, presence: true
	validates :tax, numericality: true
	

	validates :total, presence: true
	validates :total, numericality: true

	

	def calculate_subtotal(price, quantity)
		self.subtotal = price*quantity
	end

	def calculate_tax
		self.tax = subtotal*0.0875
	end
	def calculate_total
		self.total = subtotal+tax
	end
end
