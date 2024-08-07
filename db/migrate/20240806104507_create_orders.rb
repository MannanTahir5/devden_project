class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :id
      t.integer :user_id
      t.timestamp :order_date
      t.string :status
      t.decimal :total_amount

      t.timestamps
    end
  end
end
