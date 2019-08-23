class Admin::GenreController < ApplicationController
    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        genre.save
        redirect_to new_admin_product_path
    end

    private

    def genre_params
        params.require(:genre).permit(:id, :genrename)
    end

    def admin_users
        redirect_to products_path unless current_user.admin?
    end
end
