class AddFieldsToViewer < ActiveRecord::Migration
  def change
    add_column :viewers, :name, :string
    add_column :viewers, :image, :string
  end
end
