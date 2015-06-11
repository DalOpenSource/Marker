class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :title
      t.integer :course_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
