class StaticPagesController < ApplicationController
    require 'flickr'

    # The credentials can be provided as parameters:

    flickr = Flickr.new FLICKR_API_KEY, FLICKR_SECRET_KEY

    # Alternatively, if the API key and Shared Secret are not provided, Flickr will attempt to read them
    # from environment variables:
    # ENV['FLICKR_API_KEY']
    # ENV['FLICKR_SHARED_SECRET']

    flickr = Flickr.new

    # Flickr will raise an error if either parameter is not explicitly provided, or available via environment variables.

    def index
        @flickr_id = "202172076@N08" unless params[:flickr_id]
        @photos = flickr.people.getPhotos :user_id => @flickr_id
    end
    
    private

    def flickr_params
        params.require(:flickr).permit(:flickr_id)

    end

end
