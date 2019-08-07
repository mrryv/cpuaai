class ElectionController < ApplicationController

  def show
    @elections = Election.all
    @campus = Campus.all
  end

  def participants
    obj = eval(params['type'].capitalize).find(params['id'])
    res = nil
    case obj.class.to_s
    when "Campus"
      res = obj.colleges
    when "Course"
      res = obj.batches
    when "College"
      res = obj.courses
    when "Election"
      res = obj.students
    end
    render json: res.to_json
  end

  def create
    participant = nil
    [:batches, :courses, :colleges, :campus].each do |c|
      if params[c]
        klass = c.to_s.singularize
        klass = "Campus" if c == :campus
        participant = eval(klass.capitalize).find(params[c].to_i)
        break
      end
    end

    options = { name: params[:name],
                date: DateTime.parse(params[:datepicker]),
                participants: participant }
    Election.create(options)
    redirect_to election_path, notice: "Successfully Created a new Election"
  end

  def delete
    Election.delete(params[:id].to_i)
    redirect_to election_path, notice: "Successfully Deleted Election"
  end

  def candidates
    @positions = Position.all
    @candidates = Candidate.all
    @elections = Election.all
  end

  def candidate_create
    options = { position_id: params[:position],
                student_id: params[:students],
                election_id: params[:election],
                approved: params[:approved][:candidate] }
    Candidate.create(options)
    redirect_to election_candidates_path, notice: "Successfully Created new Candidate"
  end

  def position_create
    Position.create(name: params[:name])
    redirect_to election_candidates_path, notice: "Successfully Created new Position"
  end

  def position_delete
    Position.delete params[:id].to_i
    redirect_to election_candidates_path, notice: "Successfully Deleted Position"
  end
end
