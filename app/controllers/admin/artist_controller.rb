class Admin::ArtistController < ApplicationController
    def new
        @artist = Artist.new
    end

    def create
        artist = Artist.new(artist_params)
        artist.save
        redirect_to "/"
    end

    private

    def artist_params
        params.require(:artist).permit(:id, :artistname)
    end
end
