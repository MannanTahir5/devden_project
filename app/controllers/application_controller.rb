class ApplicationController < ActionController::Base
  before_action :authenticate_customer!
  include Pagy::Backend
end
