class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum status: { 製造不可: 0, 製造待ち: 1, 製造中: 2, 製造完了: 3 }
end
