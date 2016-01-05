class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :user_id
      t.integer :email_recipient_id

      t.timestamps null: false
    end
  end
end
