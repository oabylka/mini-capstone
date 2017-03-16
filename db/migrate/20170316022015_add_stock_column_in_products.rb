class AddStockColumnInProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :stock_number, :integer
  end
end
