class CreateBrowsingTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :browsing_tasks do |t|
      t.references :task,  foreign_key: true
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
