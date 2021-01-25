class Shipping < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def link_shipping
    "〒" + self.postal_code	+ " " + self.address + " " + self.name #文字列同士の連結とスペースで間隔調整
  end
end
