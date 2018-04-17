class ApplicationController < ActionController::Base
  def index
  end

  def article
    @article = Article.find_by(id: params[:id])
    json = request.query_parameters['json'] == "true"
    if json
      render json: @article.to_json
      return
    end
    nolayout = request.query_parameters['nolayout'] == "true"
    if nolayout
      render "article", layout: false
      return
    end
  end
  protect_from_forgery with: :exception
end
