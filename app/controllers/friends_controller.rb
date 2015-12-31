class FriendsController < ApplicationController
  before_action only: :photos do
    get_json_response(FLICKR_FRIENDS_PHOTOS_URL, params[:user_id])
  end

  def photos
    @friends = JSON.parse(@flickr_json_response)["feed"]
    #Reason for below: XML returns a hash for one entry present
    @friends_photos_entries = @friends["entry"].class == Array ? @friends["entry"] : [@friends["entry"]]
    if @friends_photos_entries.present?
      flash.now[:notice] = "My Friends Photos"
      render template: 'home/index', locals: { photos: @friends_photos_entries }
    else
      redirect_to photos_user_path(params[:user_id]), flash: { error: "There are no #{@friends["title"]}" }
    end
  end
end
