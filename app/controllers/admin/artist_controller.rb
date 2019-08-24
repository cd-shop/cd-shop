class Admin::ArtistController < ApplicationController
    def new
        @artist = Artist.new
    end

    def create
        artist = Artist.new(artist_params)
        artist.save
        redirect_to new_admin_product_path
    end

    private

    def artist_params
        params.require(:artist).permit(:id, :artistname)
    end

    def admin_users
        redirect_to products_path unless current_user.admin?
    end
end
