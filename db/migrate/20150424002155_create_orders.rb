class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
