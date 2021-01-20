class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :shippings
  
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :adress, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
