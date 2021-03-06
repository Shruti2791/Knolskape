class UsersController < ApplicationController
  before_action only: :photos do
    get_json_response(FLICKR_USER_PHOTO_URL, params[:id])
  end

  def photos
    @user_photos = JSON.parse(@flickr_json_response)["feed"]
    #Reason for below: XML returns a hash for one entry present
    @user_entries = @user_photos["entry"]
    if @user_entries.present?
      @user_entries = @user_entries.class == Array ? @user_photos["entry"] : [@user_photos["entry"]]
      flash.now[:notice] = "User Photos"
      render :photos, locals: { photos: @user_entries }
    else
      flash[:error] = "There are no #{@user_photos["title"]}"
      redirect_to root_path
    end
  end
end
