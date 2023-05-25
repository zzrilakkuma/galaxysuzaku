class OrderConfirmationJob < ApplicationJob
  
  def perform(order_id)
    order = Order.find(order_id)
    OrderMailer.order_confirmation(order).deliver_now
  end
end
