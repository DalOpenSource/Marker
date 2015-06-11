class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.integer :course_id
      t.integer :user_id
      t.integer :standing

      t.timestamps null: false
    end
  end
end
