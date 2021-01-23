class Customers::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.save(customer_params)
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
