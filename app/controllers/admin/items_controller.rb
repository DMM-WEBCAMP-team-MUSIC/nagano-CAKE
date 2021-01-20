class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item)
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render "edit"
    end
  end
  

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :genre_id, :price, :status)
  end
end
