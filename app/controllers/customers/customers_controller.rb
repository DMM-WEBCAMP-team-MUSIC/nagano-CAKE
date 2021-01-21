class Customers::CustomersController < ApplicationController
  def show
   @customer = Customer.where(params[:id])
   @customers = Customer.all
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
  end
end
