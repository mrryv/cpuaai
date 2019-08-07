class NewsController < ApplicationController

  def show
    @news = News.all
    @campus = Campus.all
  end

  def create
    subscriber = nil
    [:batches, :courses, :colleges, :campus].each do |c|
      if params[c]
        klass = c.to_s.singularize
        klass = "Campus" if c == :campus
        subscriber = eval(klass.capitalize).find(params[c].to_i)
        break
      end
    end

    options = { title: params[:title],
                article: params[:article],
                subscriber: subscriber,
                image: params[:image] }
    News.create(options)
    redirect_to news_path, notice: "Successfully Created News"
  end

  def delete
    News.delete(params[:id].to_i)
    redirect_to news_path, notice: "Successfully Deleted News"
  end
end
