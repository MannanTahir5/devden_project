class CreateCart < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.integer :id
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
