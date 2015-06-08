class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :prefix      # CSCI
      t.integer :code       # 3101
      t.string :name        # Intorduction to Algorithms
      t.text :description   # ...
      t.integer :year       # 2015
      t.integer :semester   # 2 (Fall)
      t.integer :section    # 1
    end
  end
end
