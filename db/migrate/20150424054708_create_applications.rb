class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :hometown
      t.string :website
      t.string :comment

      t.timestamps
    end
  end
end
