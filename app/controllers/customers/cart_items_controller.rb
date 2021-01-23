class Customers::CartItemsController < ApplicationController
  
  
  
  
  
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  
  
  
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
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = cart_item_params[:quantity]
    @cart_item.save
  end
  
  def destroy
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
