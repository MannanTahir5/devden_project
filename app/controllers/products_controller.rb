class ProductsController < ApplicationController

  def index
    if params[:category]
      @pagy, @product = pagy(Product.where(category: params[:category]), limit: 6)
    else
      @pagy, @product = pagy(Product.all, limit: 9) 
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end