class Customers::OrdersController < ApplicationController
  
  def index
    @orders = current_customer.orders
  end

  def show
  end
  
  def new
    @shippings = Shipping.where(customer_id: current_customer) #shippingテーブルからcustomer_idがcurrent_customerと一致するものをすべて探して返す
  end
  
  def confirm
    @order = Order.new #新しいOrderレコード作成
    @order.customer_id = current_customer.id #@orderのcustomerカラムに、ログインしているcustomerのidを代入
    @order.delivery_fee = 800 #同上
    @order.total_fee = current_customer.total_payment #total_paymentはcustomerモデルで定義したメソッド。customerが持っているカート内商品の合計額を返す
    @order.payment = new_order_params[:payment]
    if new_order_params[:radio_address] == "own_address" #"自分の住所"ボタンが押された場合
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif new_order_params[:radio_address] == "registered_address" #"登録済み配送先から選択"ボタンが押された場合
      shipping = Shipping.find(new_order_params[:shipping]) #プルダウンで選ばれた住所のIDでshippingを呼び出す
      @order.name = shipping.name #上から代入
      @order.postal_code = shipping.postal_code #同上
      @order.address = shipping.address #同上
    elsif new_order_params[:radio_address] == "new_address" #"新しいお届け先"ボタンが押された場合
      @order.name = new_order_params[:new_name] #フォームの内容を代入
      @order.postal_code = new_order_params[:new_postal_code] #同上
      @order.address = new_order_params[:new_address] #同上
    end
  end
  
  def create

  end
  
  def finish
  end
  
  private
  def new_order_params
    params.permit(:payment, :radio_address, :shipping, :new_postal_code, :new_address, :new_name)
  end
  
end
