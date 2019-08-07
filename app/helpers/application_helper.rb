module ApplicationHelper

  def get_bread_crumb(url)
    begin
      breadcrumb = ''
      sofar = '/'
      elements = url.split('/')
      for i in 1...elements.size
        sofar += elements[i] + '/'
        if i%2 == 0
          begin
            breadcrumb += "<a href='#{sofar}'>"  + eval("#{elements[i - 1].singularize.camelize}.find(#{elements[i]}).name").to_s.capitalize + '</a>'
          rescue
            breadcrumb += elements[i].capitalize
          end
        else
          breadcrumb += "<a href='#{sofar}'>#{elements[i].capitalize}</a>"
        end
        breadcrumb += ' | ' if i != elements.size - 1
      end
      breadcrumb
    rescue
      'Not available'
    end
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def format_participants(participants)
    case participants.class.to_s
    when "Batch"
      course = participants.course
      college = course.college
      campus = college.campus
      "Campus: #{campus.name} College: #{college.name} Course: #{course.course} Year:#{participants.year}"
    when "Course"
      college = participants.college
      campus = college.campus
      "Campus: #{campus.name} College: #{college.name} Course: #{participants.course}"
    when "College"
      campus = participants.campus
      "Campus: #{campus.name} College: #{participants.name}"
    when "Campus"
      "Campus: #{participants.name}"
    end
  end
end
