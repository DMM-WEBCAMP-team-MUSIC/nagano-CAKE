class Customers::CartItemsController < ApplicationController
  
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item_add = CartItem.find_by(item: @cart_item.item)
    if @cart_item_add.present?
      @cart_item.quantity += @cart_item_add.quantity
      @cart_item_add.destroy
    end
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
      render "customers/items/show"
    end
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if cart_item_params[:quantity] == "0"
      @cart_item.destroy
    else
      @cart_item.quantity = cart_item_params[:quantity]
      @cart_item.save
    end
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
