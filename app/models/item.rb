class Item < ApplicationRecord
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre
  attachment :image
end
