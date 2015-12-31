class HomeController < ApplicationController
  before_action only: :index do
    get_json_response(FLICKR_ALL_PHOTO_URL, "")
  end

  def index
    @all_photo_entries = JSON.parse(@flickr_json_response)["feed"]["entry"]
    flash.now[:notice] = "Flickr Photos"
    render :index, locals: { photos: @all_photo_entries }
  end
end
