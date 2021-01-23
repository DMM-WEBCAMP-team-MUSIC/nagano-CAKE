class Customers::CustomersController < ApplicationController
  def show
   @customer = Customer.where(params[:id])
   @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    end
  end

  def withdraw
  end

  def unsubscribe
  end

  private

  def customer_params
   params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end
end
