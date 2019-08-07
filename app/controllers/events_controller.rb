class EventsController < ApplicationController

  def show
    @events = Event.all
    @event_types = EventType.all
    @campus = Campus.all
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
                event_type_id: params[:event_type],
                venue: params[:venue],
                date: DateTime.parse(params[:date]),
                participants: participant }
    Event.create(options)
    redirect_to events_path, notice: "Successfully Created a new Event"
  end

  def delete
    Event.delete(params[:id].to_i)
    redirect_to events_path, notice: "Successfully Deleted Event"
  end

  def approve
    Event.update(params[:id].to_i, { approved: eval(params[:value]) })
  end
end
