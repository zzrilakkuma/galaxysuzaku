class Admin::DashboardController < AdminController
    def index
      @orders = Order.all.includes(:product).order(created_at: :desc)
      @products = Product.all.order(created_at: :desc)
      # @users = User.all.order(created_at: :desc)
    end
  end