Rails.application.routes.draw do

root  to: "products#index"

  get "/suppliers" => "suppliers#index"

  get "/suppliers/new" => "suppliers#new"
  post "/suppliers" => "suppliers#create"

  get "/suppliers/:id" => "suppliers#show"


  get "/suppliers/:id/edit" => "suppliers#edit"
  patch "/suppliers/:id" => "suppliers#update"

  delete "/suppliers/:id" => "suppliers#destroy"

  post "/search" => "suppliers#search"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 #index
 get "/products" => "products#index"

# New and Create
 get "/products/new" => "products#new"
 post "/products" => "products#create"

# Show
 get "/products/:id" => "products#show"

#Edit and Updates
 get "/products/:id/edit" => "products#edit"
 patch "/products/:id" => "products#update"

# Destroy
 delete "/products/:id" => "products#destroy"

#Search Results
 post "/search" => "products#search"

 get "/products/:product_id/images/new" => "images#new"
 post "/products/:product_id/images" => "images#create"

 get "/signup" => "users#new"
 post "/users" => "users#create"

 get "/login" => "sessions#new"
 post "/login" => "sessions#create"
 get "/logout" => "sessions#destroy"

 #orders
 post "/orders" => "orders#create"
 get "/orders/:id" => "orders#show"

 #cart
 post "/carted_products" => "carted_products#create"
 get "/cart" => "carted_products#index"
 delete "/carted_products/:id" => "carted_products#destroy"


end
