class BillsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payment.all
  end
  def index
  @bills = current_user.bills
end
def index
  @bills = Bill.includes(:payments)
end

  def show
    @bill = current_user.bills.find(params[:id])
  end

  def new
    @bill = current_user.bills.build
  end

  def create
    @bill = current_user.bills.build(bill_params)
    if @bill.save
      redirect_to @bill, notice: 'Bill was successfully created.'
    else
      render :new
    end
  end
  def edit
    @bill = Bill.find(params[:id])
  end
  
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to bills_path, notice: 'Bill was successfully deleted.'
  end

  def show
    @bill = Bill.find(params[:id])
  end
  
  private

  def bill_params
    params.require(:bill).permit(:name)
  end
end
