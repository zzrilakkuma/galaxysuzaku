class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = session[:cart] ||= {}
  end

  def add_to_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    add_product_to_cart(product_id, quantity)
    redirect_to product_path(product_id), notice: 'Product added to cart.'
  end
end
