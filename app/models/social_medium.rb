class SocialMedium < ApplicationRecord
  belongs_to :social_media_type
  belongs_to :student

end
