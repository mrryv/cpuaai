class Event < ApplicationRecord
  belongs_to :participants, polymorphic: true
  belongs_to :event_type
end
