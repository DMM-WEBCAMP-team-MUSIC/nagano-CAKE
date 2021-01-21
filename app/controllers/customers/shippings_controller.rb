class Customers::ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end
  
  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to shippings_path
    end
  end
  
  def update
  end
  
  def destroy
  end
  
end
