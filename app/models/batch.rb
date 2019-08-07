class Batch < ApplicationRecord
  has_many :news, as: :subscriber
  has_many :events, as: :participants

  belongs_to :course
  has_many :students

  def description
    course = self.course
    college = course.college
    campus = college.campus
    "#{campus.name} Campus: #{college.name} Dept. Course: #{self.course.course} - #{self.year}"
  end
end
