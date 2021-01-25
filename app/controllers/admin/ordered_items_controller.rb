class Admin::OrderedItemsController < ApplicationController

  def update
    @ordered_item = OrderedItem.find(params[:id])
    if @ordered_item.update(ordered_item_params)
      if @ordered_item.status == "製作中"
      redirect_to admin_order_path(@ordered_item)
    else
      render "show"
    end
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end
end
