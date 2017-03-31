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
    if current_user
     @cart ||=CartedProduct.where(id: current_user.id, status:"carted")
    end
  end
  helper_method :cart

  def shopping_cart_count
    if current_user
      current_user.carted_products.where(status: "carted").length
    end
  end
  helper_method :shopping_cart_count

  def authenticate_user!
      if !current_user
        flash[:danger] = "You must be an admin to do that!"
        redirect_to "/login"
      end
  end

  def authenticate_admin!
    if !current_user && current_user.admin
        flash[:danger] = "You must be an admin to do that!"
        redirect_to "/"
    end
  end
end
