class Product < ApplicationRecord
  # Product belongs to one category
  belongs_to :category, optional: true

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  scope :visible, -> { where(is_hidden: false) }
  scope :on_special, -> { where(is_on_special: true) }
end
