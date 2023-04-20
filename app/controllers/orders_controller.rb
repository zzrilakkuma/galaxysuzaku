class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :authenticate_admin!, only: [:index]

  def index
    @orders = Order.all.includes(:product)
  end

  def create
    if user_signed_in?
      order = current_user.orders.create

      cart_items.each do |item|
        order.order_items.create(product: item[:product], quantity: item[:quantity])
      end
    
      session[:cart] = {}
      redirect_to order_path(order), notice: 'Order created successfully.'
    else
      redirect_to new_user_session_path, alert: 'You need to sign in or sign up before continuing.'
    end
  end

  def show
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def cart_items
    current_cart.map do |product_id, quantity|
      {
        product: Product.find(product_id),
        quantity: quantity
      }
    end
  end

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end
end
