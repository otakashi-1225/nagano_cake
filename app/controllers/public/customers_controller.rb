class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def quit
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "更新に成功しました"
      redirect_to customer_path(current_user.id)
    else
      render :edit
    end
  end


  def flag
    @customer = Customer.find(current_customer.id)
    if @customer.update(is_deleted: 'TRUE')
      reset_session
      flash[:notice] = "退会しました。ご利用ありがとうございました。"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address, :email)
  end

end
