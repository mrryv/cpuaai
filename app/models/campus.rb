class Campus < ApplicationRecord
  self.table_name = "campuses"

  has_many :news, as: :subscriber
  has_many :events, as: :participants

  has_many :colleges
end
