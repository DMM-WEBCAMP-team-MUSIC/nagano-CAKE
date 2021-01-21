class Order < ApplicationRecord
  belongs_to :customer
  enum payment: { クレジットカード: 0, 振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
