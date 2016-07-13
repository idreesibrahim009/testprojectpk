class AddColumnCrudTypesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crud_types, :hstore, default: {}, null: false
  end
end
