class Expense < ApplicationRecord
  belongs_to :bill


  validates :member_name, presence: true
  validates :amount, presence: true


end