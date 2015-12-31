module FlickrHelper
  def photo_link(photo)
    photo["link"] && photo["link"][1] ? photo["link"][1]["href"] : ""
  end

  def user_name(photo)
    photo["author"]["name"]
  end

  def user_id(photo)
    photo["author"]["nsid"]
  end
end
