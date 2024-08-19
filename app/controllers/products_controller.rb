class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def male
    @product = Product.where(category: 'male')
  end

  def female
    @product = Product.where(category: 'female')
  end
end