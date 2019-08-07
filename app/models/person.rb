class Person < ApplicationRecord
  has_many :students

  def fullname
    "#{self.lastname}, #{self.firstname} #{self.middlename}"
  end
end
