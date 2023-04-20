class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = session[:cart] || {}
    @cart_items = Product.where(id: @cart.keys).map do |product|
      { product: product, quantity: @cart[product.id.to_s] }
    end
  end

  def remove_from_cart
    product_id = params[:product_id]
    cart = current_cart
    cart.delete(product_id)
    session[:cart] = cart
    redirect_to cart_path, notice: 'Product removed from cart'
  end

  def checkout
    @cart_items = cart_items
  end

  private

  def cart_items
    current_cart.map do |product_id, quantity|
      {
        product: Product.find(product_id),
        quantity: quantity
      }
    end
  end
end