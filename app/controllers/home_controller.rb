class HomeController < ApplicationController
  before_action :authenticate_customer!
  def index
    @product = Product.all
  end
end
