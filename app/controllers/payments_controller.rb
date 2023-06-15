class PaymentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @bill = current_user.bills.find(params[:bill_id])
    @payment = @bill.payments.build
  end

  def create
    @bill = current_user.bills.find(params[:bill_id])
    @payment = @bill.payments.build(payment_params)
    if @payment.save
      redirect_to @bill, notice: 'Payment was successfully added.'
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:member_name, :amount)
  end
end
