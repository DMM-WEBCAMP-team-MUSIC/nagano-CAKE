class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
