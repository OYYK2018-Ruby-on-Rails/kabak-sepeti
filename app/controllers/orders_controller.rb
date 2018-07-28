class OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    render json: order
  end

  private

  def order_params
    params.permit(:total, :email, :status)
  end
end
