class Admin::OrdersController < ApplicationController
  def index
    if params[:customer_id]
      @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order.customer
    @ordered_items = @order.ordered_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == "入金確認"
        @order.ordered_items.each do |ordered_item|
          ordered_item.update(status: "製作待ち")
        end
      end
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:status, :total_fee, :delivery_fee)
  end

end
