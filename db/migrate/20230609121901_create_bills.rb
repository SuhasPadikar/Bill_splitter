class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :name

      t.timestamps
    end
  end
end
