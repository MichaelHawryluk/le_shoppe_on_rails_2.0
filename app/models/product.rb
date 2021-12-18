class Product < ApplicationRecord
  validates :name, :description, :product_stock, :price, presence: true
end
