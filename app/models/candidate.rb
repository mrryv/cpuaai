class Candidate < ApplicationRecord
  belongs_to :student
  belongs_to :position
  belongs_to :election
end
