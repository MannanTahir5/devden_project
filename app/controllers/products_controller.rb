class ProductsController < ApplicationController
  def index
    if params[:category]
      @product = Product.where(category: params[:category])
    else
      @product = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end