class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :team,  foreign_key: true
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
