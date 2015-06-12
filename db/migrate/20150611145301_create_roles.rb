class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :title, default: :student # %(:student :marker :instructor), default a student
      t.belongs_to :course # generate foreign key course_id
      t.belongs_to :user # generate foreign key user_id
      t.timestamps null: false
    end
    add_index :roles, :course_id
    add_index :roles, :user_id
  end
end
