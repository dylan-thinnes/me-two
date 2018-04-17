class ApplicationController < ActionController::Base
  def index
  end

  def projects
  end

  def contact
  end

  def blog
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
    nolayout = request.query_parameters['nolayout'] == "true"
    if nolayout
      render "article", layout: false, status: status
      return
    end
  end
  protect_from_forgery with: :exception
end
