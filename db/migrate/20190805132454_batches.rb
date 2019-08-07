class Batches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.integer :course_id
      t.string :year
      t.timestamps
    end
  end
end
