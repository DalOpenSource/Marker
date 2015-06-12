class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :title # %(:student :marker :instructor)
      t.integer :course_id
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :roles, :course_id
    add_index :roles, :user_id
  end
end
