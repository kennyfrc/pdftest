class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.decimal :unit_price
      t.integer :quantity
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
