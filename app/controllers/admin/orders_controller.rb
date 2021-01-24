class Admin::OrdersController < ApplicationController
  def index
    @oders = Oder.page(params[:page]).per(10)
  end

  def show
  end

  def update
  end
end
