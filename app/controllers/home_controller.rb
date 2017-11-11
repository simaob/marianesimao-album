class HomeController < ApplicationController
  def index
    @pictures = Picture.order(:created_at)
    if params[:query]
      @pictures = @pictures.where("title ilike ? OR description ilike ?",
                                  "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end
end
