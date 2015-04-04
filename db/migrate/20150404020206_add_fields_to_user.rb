class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :member, :boolean
    add_column :users, :admin, :boolean
  end
end
