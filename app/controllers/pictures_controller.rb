class PicturesController < ApplicationController

  before_action :http_authentication

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to new_picture_url, notice: "Picture added with success"
    else
      render :new
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end

  def http_authentication
    return if Rails.env == 'development'
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['username'] && password == ENV['password']
    end
  end
end
