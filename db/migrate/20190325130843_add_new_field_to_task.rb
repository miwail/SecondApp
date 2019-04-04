class AddNewFieldToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :complated, :boolean
  end
end
