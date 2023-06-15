class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :member_name
      t.decimal :amount
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
