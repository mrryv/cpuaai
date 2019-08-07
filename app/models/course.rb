class Course < ApplicationRecord
  has_many :news, as: :subscriber
  has_many :events, as: :participants

  has_many :batches
  belongs_to :college
end
