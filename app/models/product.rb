class Product < ApplicationRecord

	def sale_message(price)
		price = price
		if price < 2
			"Discount item!"
		else
			"Everyday Value!"
		end
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

end
