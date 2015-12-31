require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def get_json_response(url, params)
      flickr_response = Net::HTTP.get_response(URI.parse(url + params)).body
      @flickr_json_response = Hash.from_xml(flickr_response).to_json
    end
end
