class ApplicationController < ActionController::Base
  def index
  end

  def article
    @article = Article.find(params[:id])
  end
  protect_from_forgery with: :exception
end
