class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string    :task_name, null: false
      t.text      :content
      t.datetime  :target_date
      t.string    :report
      t.string    :final_report
      t.string    :task_item
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
