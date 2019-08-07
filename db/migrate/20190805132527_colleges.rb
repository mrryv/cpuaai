class Colleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.integer :campus_id
      t.string :name
      t.timestamps
    end
  end
end
