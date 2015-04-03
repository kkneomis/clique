class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :string
    add_column :users, :image, :string
    add_column :users, :hometown, :string
  end
end
