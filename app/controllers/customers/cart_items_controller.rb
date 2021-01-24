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
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
    
  
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = cart_item_params[:quantity]
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
