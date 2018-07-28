class OrdersController < ApplicationController
  def create
    order = Order.create
    render json: order
  end
end
