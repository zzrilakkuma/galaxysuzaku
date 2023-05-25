class UsersController < ApplicationController
  def orders
    @user = User.find(params[:id])
    @orders = @user.orders
  end
end