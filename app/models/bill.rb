class Bill < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def equal_share
    total_members = payments.distinct.count(:member_name)
    total_amount = payments.sum(:amount).to_f

    if total_members > 0
      total_amount / total_members
    else
      0
    end
  end
end
