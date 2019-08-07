class Election < ApplicationRecord
  belongs_to :participants, polymorphic: true

  def students
    batch_ids = nil

    case self.participants_type
    when "Campus"
      batch_ids = []
      self.participants.colleges.each do |college|
        batch_ids += college.courses.collect { |c| c.batches.map(&:id) }.flatten.uniq
      end
    when "College"
      batch_ids = self.participants.courses.collect { |c| c.batches.map(&:id) }.flatten.uniq
    when "Course"
      batch_ids = self.participants.batches.map(&:id)
    when "Batch"
      batch_ids = [self.participants_id]
    end
    Student.where(batch_id: batch_ids).collect { |s| [s.id, s.person.fullname] }
  end
end
