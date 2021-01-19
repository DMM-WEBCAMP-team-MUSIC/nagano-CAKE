class Admin::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item)
    end
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :genre_id, :price, :status)
  end
end
