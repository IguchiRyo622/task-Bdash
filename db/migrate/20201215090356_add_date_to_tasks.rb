class AddDateToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :final_report_date, :datetime
  end
end
