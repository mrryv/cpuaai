class Candidate < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.integer :position_id
      t.integer :student_id
      t.integer :election_id
      t.boolean :approved
      t.timestamps
    end
  end
end
