class SocialMedias < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media do |t|
      t.string :locator
      t.integer :social_media_type_id
      t.integer :student_id
      t.timestamps
    end
  end
end
