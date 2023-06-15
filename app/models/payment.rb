class Payment < ApplicationRecord
  belongs_to :bill
  def new
    @bill = Bill.find(params[:bill_id])
    @payment = Payment.new
  end
  def money_spent
    amount
  end
  validates :member_name, uniqueness: { scope: :bill_id }
end
