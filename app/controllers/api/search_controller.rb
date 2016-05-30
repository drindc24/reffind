class Api::SearchController < ApplicationController
  def search
    begin
      @photos = Flickr.photos.search(text: params[:search_text])

      render json: @photos
    rescue => e
      render json: {error: e}
    end
  end
end