class Admin::OrderedItemsController < ApplicationController

  def update
    @ordered_item = OrderedItem.find(params[:id])
    if @ordered_item.update(ordered_item_params)
      if @ordered_item.status == "製作中"
        @ordered_item.order.update(status: "製作中")
      elsif @ordered_item.status == "製作完了"
        flge = true
        @ordered_item.order.ordered_items.each do |ordered_item|
          unless ordered_item.status == "製作完了"
            flge = false
          end
        end
        if flge
          @ordered_item.order.update(status: "発送準備中")
        end
      end
      redirect_to admin_order_path(@ordered_item.order)
    else
      render "show"
    end
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end
end
