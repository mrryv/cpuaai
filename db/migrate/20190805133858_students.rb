class Students < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :batch_id
      t.integer :person_id
      t.boolean :alumni
      t.boolean :voter
      t.timestamps
    end
  end
end
