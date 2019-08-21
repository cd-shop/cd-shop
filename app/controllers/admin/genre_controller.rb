class Admin::GenreController < ApplicationController
    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        genre.save
        redirect_to "/"
    end

    private

    def genre_params
        params.require(:genre).permit(:id, :genrename)
    end

end
