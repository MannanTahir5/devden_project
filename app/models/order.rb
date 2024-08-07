class  Order < ActiveRecord::Base
  belongs_to :customer
  has_one :payment_method
  has_one :cart
end