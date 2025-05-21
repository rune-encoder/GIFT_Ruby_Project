class Category < ApplicationRecord
  # Category has many products
  # If a category is deleted, the products are not deleted but their category is set to null
  has_many :products, dependent: :nullify
end
