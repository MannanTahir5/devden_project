class Product < ApplicationRecord
  include Ransackable

  has_one_attached :image

  enum size: {
    small: 0,
    medium: 1,
    large: 2
  }

  enum category: {
    male: 0,
    female: 1
  }
end