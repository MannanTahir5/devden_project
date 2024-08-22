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
end