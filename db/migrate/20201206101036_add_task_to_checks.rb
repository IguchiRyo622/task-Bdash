class AddTaskToChecks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :check, :boolean, default: false, null:false
  end
end
