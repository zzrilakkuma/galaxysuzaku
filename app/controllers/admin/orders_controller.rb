class Admin::OrdersController < AdminController
  def index
    @orders = Order.all.includes(:product)
  end
end