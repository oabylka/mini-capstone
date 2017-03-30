class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def categories
  	@categories ||= Category.all
  end
  helper_method :categories

  def cart
    @cart ||=CartedProduct.where(id: current_user.id, status:"carted")
  end
  helper_method :cart

  def shopping_cart_count
    if current_user
      current_user.carted_products.where(status: "carted").length
    end
  end
  helper_method :shopping_cart_count

  def authenticate_user!
  		redirect_to "/login" unless current_user
  end
end
