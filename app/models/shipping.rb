class Shipping < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence: true
  validates :adress, presence: true
  validates :name, presence: true
end
