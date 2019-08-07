class College < ApplicationRecord
  has_many :news, as: :subscriber
  has_many :events, as: :participants

  belongs_to :campus
  has_many :courses
end
