Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/view_products" => "products#view_products"

  get "/new_product_form" => "products#new_product_form"
  post "/new_product" => "products#new_product"

end
