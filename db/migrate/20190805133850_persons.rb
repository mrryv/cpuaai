class Persons < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.datetime :birthdate
      t.text :address
      t.string :email
      t.timestamps
    end
  end
end
