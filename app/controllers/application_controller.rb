class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  protect_from_forgery with: :exception
  
  helper_method :current_cart
  
  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
