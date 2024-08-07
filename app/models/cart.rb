class Cart < ApplicationRecord
  has_one :order
  has_many :products
  belongs_to :cart
end