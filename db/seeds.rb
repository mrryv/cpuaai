# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

#ActiveRecord::Base.connection.execute("TRUNCATE social_media_types")
social_media_types = ['facebook', 'instagram', 'twitter', 'linkedin',
                      'pinterest', 'tumblr', 'snapchat'].collect do |s|
  SocialMediaType.create name: s
end

#ActiveRecord::Base.connection.execute("TRUNCATE event_types")
event_types = ['Batch Reunion', 'College Reunion', 'Alumni Homecoming'].collect do |e|
  EventType.create name: e 
end

#ActiveRecord::Base.connection.execute("TRUNCATE campuses")

campuses = ['Diliman', 'Cebu', 'Los Banos', 'Miag-ao', 'Manila'].collect do |e|
  Campus.create name: e
end

#ActiveRecord::Base.connection.execute("TRUNCATE colleges")
['IT', 'Law', 'Medicine', 'Engineering', 'Social Sciences', 'Arts'].each do |c|
  campuses.each do |campus|
    College.create(campus: campus, name: c)
  end
end

#ActiveRecord::Base.connection.execute("TRUNCATE courses")
#ActiveRecord::Base.connection.execute("TRUNCATE batches")
{ 'IT': ['BSIT','BSCS','BSCE'],
  'Law': ['LLB', 'JDL'],
  'Medicine': ['BSN', 'DPT', 'DMD'],
  'Engineering': ['BCE', 'BChE', 'BEE'],
  'Social Sciences': ['BLA', 'MPS', 'Ph.B'],
  'Arts': ['BFA','BMEd'] }.each do |k, v|

    College.where(name: k).each do |college|
      v.each do |course|
        c = Course.create college: college, course: course
        (2000..2020).each do |y|
          Batch.create(course: c, year: y.to_s)
        end
      end
    end

end

#ActiveRecord::Base.connection.execute("TRUNCATE people")
[
  ['Lloyd', 'Sanchez', 'V', '1985-01-20', '342-H Tres de Abril St. Cebu City', 'lloydvsanchez@gmail.com'],
  ['Jose', 'Rizal', 'P', '1990-01-01', '123 Calamba Laguna', 'joseprizal@gmail.com'],
  ['Andres', 'Bonifacio', 'X', '1995-01-01', '321 Tondo Manila', 'boni_b@gmail.com'],
  ['Pablo', 'Escobar', 'G', '2000-01-01', 'Medelin Colombia', 'pablo_g@gmail.com'],
  ['Poncho', 'Pilato', 'X', '1995-02-14', 'Golgotha Israel', 'poncho_p@gmail.com'],
  ['Grom', 'Hellscream', 'Z', '1998-02-01', 'Draenor', 'grom@asdf.com'],
  ['Thrall', 'Durotan', 'H', '1999-01-02', 'Draenor', 'thrall@asdf.com'],
  ['Sylvanas', 'Windrunner', 'T', '1996-12-03', 'Azeroth', 'sylvanas@asdf.com']
].each do |a|
  Person.create(firstname: a[0], lastname: a[1], middlename: a[2], birthdate: DateTime.parse(a[3]),
                address: a[4], email: a[5])
end


#ActiveRecord::Base.connection.execute("TRUNCATE students")
#ActiveRecord::Base.connection.execute("TRUNCATE social_media")
(0..3).each do |i|
  batch = Batch.offset(rand(Batch.count)).first
  Person.all.each do |p|
    student = Student.create(batch: batch, person: p, alumni: 1, voter: 1)
    smt = social_media_types.sample
    SocialMedium.create(social_media_type_id: smt.id, student: student, locator: "#{smt.name}: #{p.fullname}")
  end
end

#ActiveRecord::Base.connection.execute("TRUNCATE news")
(0..10).each do |i|
  type = [Campus, College, Course, Batch].sample
  subscriber = type.offset(rand(type.count)).first
  News.create(title: "News #{i}", article: "Dummy article #{i}", subscriber: subscriber)
end

#ActiveRecord::Base.connection.execute("TRUNCATE events")
(0..10).each do |i|
  type = [Campus, College, Course, Batch].sample
  participant = type.offset(rand(type.count)).first
  Event.create(name: "Event #{i}", venue: "Venue #{i}",
               event_type: event_types.sample,
               date: (DateTime.now + rand(365).days),
               participants: participant)
end

#ActiveRecord::Base.connection.execute("TRUNCATE elections")
(0..10).each do |i|
  type = [Campus, College, Course, Batch].sample
  participant = type.offset(rand(type.count)).first
  Election.create(name: "Election #{i}", date: (DateTime.now + rand(365).days), participants: participant)
end

#ActiveRecord::Base.connection.execute("TRUNCATE positions")
positions = ['President', 'Secretary', 'Treasurer', 'Muse', 'Packmule', 'Decor'].collect do |p|
  Position.create(name: p)
end

=begin
ActiveRecord::Base.connection.execute("TRUNCATE candidates")
(0..2).each do |i|
  position = positions.sample
  student
end
=end
