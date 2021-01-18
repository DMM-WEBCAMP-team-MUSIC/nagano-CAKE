class Admin::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find_by(id: params[:id])
    @genre = @item.genre
  end

  def new
  end

  def edit
  end
  
  def create
  end
  
  def update
  end
end
