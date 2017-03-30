class User < ApplicationRecord
	has_many :orders
	has_secure_password
	has_many :carted_products
end
