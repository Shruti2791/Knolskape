module FlickrHelper
  def photo_link(photo)
    photo["link"] && photo["link"].last ? photo["link"].last["href"] : ""
  end

  def user_name(photo)
    photo["author"]["name"]
  end

  def user_id(photo)
    photo["author"]["nsid"]
  end
end
