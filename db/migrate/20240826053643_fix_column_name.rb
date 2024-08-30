class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :user_id, :customer_id
  end
end
