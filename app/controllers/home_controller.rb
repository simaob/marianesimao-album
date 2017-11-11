class HomeController < ApplicationController
  before_action :basic_http_auth

  def index
    @pictures = Picture.order(:created_at)
    if params[:query]
      @pictures = @pictures.where("title ilike ? OR description ilike ?",
                                  "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  private

  def basic_http_auth
    return if Rails.env == 'development'
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['PUBLIC_USERNAME'] && password == ENV['PUBLIC_PASSWORD']
    end
  end
end
