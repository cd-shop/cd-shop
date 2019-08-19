class Admin::ProductsController < ApplicationController

    def new
        @product = Product.new
        @genre = Genre.new
        @label = Label.new
        @artist = Artist.new
    end
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_products_path
        end

        @label = Label.new(label_params)
        if @label.save
            redirect_to admin_products_path
        end
        
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to admin_products_path
        end
        # product = Product.new(product_params)
        # genre = Genre.find_or_create_by(genrename: params[:genrename])
        # product.genre_id = genre.id
        # label = Label.find_or_create_by(params[:id])
        # product.label_id = label.id
        # artist = Artist.find_or_create_by(params[:id])
        # product.artist_id = artist.id
        # product.save
        # redirect_to admin_products_path
    end

    def index
        @products = Product.all
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    # def product_params
    #     params.require(:product).permit(:productname, :sale_status, :price, :image, genres_attributes: [:genrename], artists_attributes: [:id, :artistname], labels_attributes: [:id, :labelname])
    # end
        # def product_params
    #     params.require(:product).permit(:genre_id, :label_id, :artist_id, :productname, :sale_status, :price, :image)
    # end

    def genre_params
        params.require(:genre).permit(:genrename)
    end

    def label_params
        params.require(:label).permit(:lablename)
    end

    def artist_params
        params.require(:artist).permit(:artistname)
    end
end