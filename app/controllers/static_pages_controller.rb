class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        begin
            flickr = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_SECRET_KEY']
            if params[:flickr].present?
                @flickr_id = params[:flickr][:flickr_id]
            else
                @flickr_id = "202172076@N08"
            end

            @photos = flickr.people.getPhotos user_id: @flickr_id, extras: 'url_q'
            puts 'photos'
            puts @photos.inspect
            puts 'photos'
        rescue 
            Timeout::Error => e
            puts e
            flash[:notice] = "Oops, sorry the api has timed out"
        rescue 
            StandardError => e
            puts e
            flash[:notice] = "Oops, sorry the api has timed out"
        end
    end
end
