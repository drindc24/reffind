class Api::SearchController < ApplicationController
  def search
    @photos = Flickr.photos.search(text: params[:search_text])

    render json: @photos
  end
end