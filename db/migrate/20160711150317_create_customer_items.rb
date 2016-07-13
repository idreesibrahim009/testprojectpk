class CreateCustomerItems < ActiveRecord::Migration
  def change
    create_table :customer_items do |t|
      t.integer :customer_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
