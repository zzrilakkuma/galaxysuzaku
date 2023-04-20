class OrdersController < ApplicationController
  def index
    @orders = Order.all.includes(:product)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      redirect_to @order.product, alert: 'Order creation failed.'
    end
  end

  def show
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end
end
