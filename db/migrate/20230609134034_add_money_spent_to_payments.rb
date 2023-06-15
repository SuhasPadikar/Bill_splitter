class AddMoneySpentToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :money_spent, :decimal
  end
end
