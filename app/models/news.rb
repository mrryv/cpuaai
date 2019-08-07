class News < ApplicationRecord
  belongs_to :subscriber, polymorphic: true
  has_attached_file :image
  do_not_validate_attachment_file_type :image
end
