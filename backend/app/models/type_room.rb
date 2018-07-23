class TypeRoom < ApplicationRecord
  validates :price, :name, presence: true
end