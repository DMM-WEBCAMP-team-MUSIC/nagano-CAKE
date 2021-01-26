class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :shippings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  
  def active_for_authentication?
    super && self.status
  end
  
  def total_payment
    total = 0 #totalは最初は0円
    self.cart_items.each do |cart_item| #全商品繰り返し
      total = total + cart_item.quantity * (cart_item.item.price * 1.1).floor #totalに、quantityとpriceと消費税をかけた額を足す
    end
    return total #こう書くことでcustomer.totalpaymentを呼ぶと、結果的に上の処理がされたtotalが呼べる
  end
  
end
