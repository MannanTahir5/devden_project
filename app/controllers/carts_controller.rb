class CartsController < ApplicationController
  def index
    @order = Order.find_or_create_by(customer: current_customer, status: 'pending')
    @cart_items = @order.carts.includes(:product) if @order
  end

  def delete_from_cart
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to carts_path, notice: 'Item removed from cart'
  end
end