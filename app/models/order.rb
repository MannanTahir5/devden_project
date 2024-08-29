class  Order < ActiveRecord::Base
  belongs_to :customer
  has_one :payment_method
  has_many :carts
  has_many :products , through: :carts

  enum status:{
   pending: 0,
   complete: 1
  }
end