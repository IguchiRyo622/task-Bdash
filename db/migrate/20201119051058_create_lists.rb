class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :list_name, null: false
      t.references :team,  foreign_key: true
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
