class Cart < ApplicationRecord
  include Ransackable
  belongs_to :product
  belongs_to :order
end