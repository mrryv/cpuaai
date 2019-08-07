class Events < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :event_type_id
      t.string :name
      t.string :venue
      t.datetime :date
      t.string :participants_type
      t.integer :participants_id
      t.boolean :approved, :default => 0
      t.timestamps
    end
  end
end
