class Courses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :college_id
      t.string :course
      t.timestamps
    end
  end
end
