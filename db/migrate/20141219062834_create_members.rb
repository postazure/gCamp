class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
