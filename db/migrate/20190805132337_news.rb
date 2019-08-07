class News < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :article
      t.integer :subscriber_id
      t.string :subscriber_type
      t.timestamps
    end
  end
end
