class HomeController < ApplicationController

  def dashboard
    @title = "Dashboard"

    @events = Event.where("date >= ?", Date.today.strftime('%F')).limit(6)
    @news = News.all.order(id: :desc).limit(6)
  end

  def index

  end

end
