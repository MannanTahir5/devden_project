class OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @order = Order.where(customer_id: current_customer.id, status: 'complete')
  end

  def show
    @order = Order.find(params[:id])
    @cart = @order.carts
  end
end