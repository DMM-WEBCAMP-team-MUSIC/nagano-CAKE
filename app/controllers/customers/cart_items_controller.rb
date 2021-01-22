class Customers::CartItemsController < ApplicationController
  
  
  
  
  
  
  def index
    @cart_items = current.cart_items
  end
  
  
  def add_item
    if @cart_item.blank
    end
  endfi
  def create
    item = CartItem.new(cart_item_params)
    item.customer_id = current_customer.id
    if item.save
      redirect_to cart_items_path
    else
      
    end
  end
  
  def all_destroy
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
