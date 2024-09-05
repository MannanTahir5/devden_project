class OrdersController < ApplicationController
  before_action :set_order

  def index
    @order = Order.where(customer_id: current_customer.id, status: 'complete')
  end

  def show
    @cart = @order.carts
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
end
