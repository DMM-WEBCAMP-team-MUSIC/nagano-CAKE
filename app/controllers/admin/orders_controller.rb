class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
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
    params.require(:order).permit(:status)
  end

end
