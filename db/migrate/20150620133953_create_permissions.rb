class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :course, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.boolean :can_attend, default: true
      t.boolean :can_mark, default: false
      t.boolean :can_edit, default: false
      t.timestamps null: false
    end
  end
end
