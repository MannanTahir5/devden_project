class Cart < ApplicationRecord
  include Ransackable
  belongs_to :cart
  has_one :order
  has_many :products
end