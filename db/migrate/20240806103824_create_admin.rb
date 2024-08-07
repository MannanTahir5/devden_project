class CreateAdmin < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.integer :id
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
