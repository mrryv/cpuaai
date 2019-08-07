class Elections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.datetime :date
      t.string :participants_type
      t.string :participants_id
      t.timestamps
    end
  end
end
