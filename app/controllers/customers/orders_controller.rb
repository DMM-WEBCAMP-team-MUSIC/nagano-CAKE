class Customers::OrdersController < ApplicationController
  
  def index
    @orders = current_customer.orders
  end

  def show
  end
  
  def new
    @shippings = Shipping.where(customer_id: current_customer)
  end
  
  def create
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.delivery_fee = 800
    @order.total_fee = current_customer.total_payment
    @order.payment = new_order_params[:payment]
    
    if new_order_params[:radio_address] == "own_address"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif new_order_params[:radio_address] == "registered_address"
      #@order.name = 
      #@order.postal_code = 
      #@order.address = 
    elsif new_order_params[:radio_address] == "new_address"
      @order.name = new_order_params[:new_name]
      @order.postal_code = new_order_params[:new_postal_code]
      @order.address = new_order_params[:new_address]
    end
  end
  
  def confirm
  end
  
  def finish
  end
  
  private
  def new_order_params
    params.permit(:payment, :radio_address, :shipping, :new_postal_code, :new_address, :new_name)
  end
  
end
