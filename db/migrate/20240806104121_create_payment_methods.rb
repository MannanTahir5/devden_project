class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      t.integer :id
      t.integer :order_id
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
