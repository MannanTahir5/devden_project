class CartsController < ApplicationController
  
  def add_to_cart
    order = Order.find_or_create_by(customer: current_customer, status: 'pending')
    product = Product.find(params[:id])
    cart_item = Cart.find_or_initialize_by(order: order, product: product)
    cart_item.price = product.price

    if cart_item.save
      flash[:success] = "Product added to cart!"
      redirect_to carts_path
    else
      flash[:error] = "Could not add product to cart."
      redirect_to products_path
    end
  end

  def index
    @order = Order.find_by(customer: current_customer, status: 'pending')
    @cart_items = @order.carts.includes(:product) if @order
  end

  def delete_from_cart
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to carts_path, notice: 'Item removed from cart'
  end
end