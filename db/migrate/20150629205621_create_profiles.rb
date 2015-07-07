class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :banner_id, default: "B00000000", null: false
      t.string :first_name, default: "Student", null: false
      t.string :last_name, default: "Name", null: false
      t.string :middle_name
      t.timestamps null: false
    end
  end
end
