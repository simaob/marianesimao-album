class HomeController < ApplicationController
  def index
    @pictures = Picture.order(:created_at).limit(25)
    if params[:query]
      @pictures = @pictures.where("title ilike ? OR description ilike ?",
                                  "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end
end
