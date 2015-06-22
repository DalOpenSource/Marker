class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banner_id, :string, unique: true, null: false
    add_column :users, :first_name, :string, default: "Student"
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string, default: "Name"
  end
end
