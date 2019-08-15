require 'csv'
class ReportsController < ApplicationController

  def index
    @campus = Campus.all

    unless(params.keys & ['id', 'type']).empty?
      @elections, @events = get_events
    end
  end

  def search
    participant = nil
    [:batches, :courses, :colleges, :campus].each do |c|
      if params[c]
        klass = c.to_s.singularize
        klass = "Campus" if c == :campus
        id = params[c].to_i
        next if id == 0
        participant = eval(klass.capitalize).find(id)
        break
      end
    end

    redirect_to reports_path(id: participant&.id, type: participant&.class, search: params[:search])
  end

  def export
    elections, events = nil, nil
    unless(params.keys & ['id', 'type']).empty?
      elections, events = get_events
    end

    send_data getCSV(elections, events), filename: "report-#{Date.today}.csv"
  end

  private

  def get_events
    participant = eval(params[:type].capitalize).find_by_id(params[:id].to_i)
    elections = Election.where(participants: participant)
    events = Event.where(participants: participant)

    unless params[:search].blank?
      elections = elections.where("name LIKE ?", "%#{params[:search]}%")
      events = events.where("name LIKE ?", "%#{params[:search]}%")
    end

    [elections, events]
  end

  def getCSV(elections, events)
    CSV.generate(headers: true) do |csv|
      csv << ['id', 'type',  'title', 'date']

      {event: events}.each do |e_type, events|
        events.each do |e|
          csv << [e.id, e_type.upcase, e.name.capitalize, e.date.strftime('%F')]
        end
      end

    end
  end

end
