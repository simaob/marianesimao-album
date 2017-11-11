class PicturesController < ApplicationController

  before_action :set_picture, only: [:edit, :update]
  before_action :http_authentication

  def index
    @pictures = Picture.order(:created_at)
  end

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

  def edit
  end

  def update
    @picture.update_attributes(picture_params)
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def http_authentication
    #return if Rails.env == 'development'
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end
