class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_order
  before_action :set_product, only: :add_to_cart

  def index
    @cart_items = @order.carts.includes(:product) if @order
  end

  def add_to_cart
    @cart_item = Cart.find_or_initialize_by(order: @order, product: @product)
    @cart_item.price = @product.price

    if @cart_item.save
      flash[:success] = "Product added to cart!"
      redirect_to carts_path
    else
      flash[:error] = "Could not add product to cart."
      redirect_to products_path
    end
  end

  def delete_from_cart
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path, notice: 'Product removed from cart'
  end

    private
    def set_order
      @order = Order.find_or_create_by(customer: current_customer, status: 'pending')
    end

    def set_product
      @product = Product.find(params[:id])
    end
end