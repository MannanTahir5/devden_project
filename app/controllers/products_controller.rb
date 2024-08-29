class ProductsController < ApplicationController

  def index
    @q = Product.ransack(params[:q])

    if params[:category]
      @pagy, @product = pagy(@q.result(distinct: true).where(category: params[:category]), limit: 6)
    else
      @pagy, @product = pagy(@q.result(distinct: true), limit: 9) 
    end
  end

  def show
    @product = Product.find(params[:id])
  end

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
end