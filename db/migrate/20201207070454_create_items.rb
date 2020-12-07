class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.boolean :check, default: false, null: false
      t.string  :task_item
      t.references :task, null: false, foreign_key: true
      t.references :user,              foreign_key: true

      t.timestamps
    end
  end
end
