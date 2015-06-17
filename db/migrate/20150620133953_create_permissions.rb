class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :course, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.boolean :attends, default: false
      t.boolean :marks, default: false
      t.boolean :edits, default: false
      t.timestamps null: false
    end
  end
end
