class ProductsController < ApplicationController
  def index
    if params[:category]
      @Product = Product.where(category: params[:category])
      else
      @Product = Product.all
  end
    
  def show
    @product = Product.find(params[:id])
  end
end