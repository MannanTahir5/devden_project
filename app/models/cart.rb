class Cart < ApplicationRecord
  belongs_to :cart
  has_one :order
  has_many :products
end