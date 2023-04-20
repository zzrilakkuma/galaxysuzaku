class ApplicationController < ActionController::Base
  
  def add_product_to_cart(product_id, quantity)
    session[:cart] ||= {}
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += quantity
  end

  def current_cart
    session[:cart] ||= {}
  end
end
