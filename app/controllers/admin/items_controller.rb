class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).per(10)
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
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def update
    @genres = Genre.all
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
