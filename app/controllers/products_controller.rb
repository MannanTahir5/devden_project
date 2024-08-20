class ProductsController < ApplicationController
  def index
    if params[:category] == 'male'
      @product = Product.where(category: 'male')
    elsif params[:category] == 'female'
      @product = Product.where(category: 'female')
    else
      @product = Product.all
    end
  end
    
  def show
    @product = Product.find(params[:id])
  end
end