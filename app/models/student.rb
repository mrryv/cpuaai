class Student < ApplicationRecord
  belongs_to :batch
  belongs_to :person
  has_many :social_media
end
