class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  validates :price, presence: true, numericality: {only_integer: false}
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :status, presence: true
end
