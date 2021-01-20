class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre
  
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
end
