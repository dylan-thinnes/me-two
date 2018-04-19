class ApplicationController < ActionController::Base
  def index
    @closed = true
  end

  def projects
    checkNoLayout "projects"
  end

  def contact
    checkNoLayout "contact"
  end

  def blog
    checkNoLayout "blog"
  end

  def article
    @article = Article.find_by(id: params[:id])
    status = 200
    status = 404 if @article.nil?
    json = request.query_parameters['json'] == "true"
    if json
      render json: @article.to_json, status: status
      return
    end
    checkNoLayout "article"
  end
  protect_from_forgery with: :exception
  
  private
  def checkNoLayout(name, status = 200)
    nolayout = request.query_parameters['nolayout'] == "true"
    if nolayout
      render name, layout: "nolayout", status: status
      return
    end
  end
end
