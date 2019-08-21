class Admin::ProductsController < ApplicationController
    def new
        @product = Product.new    end

    def create

        @genre = Genre.create(genrename: params[:genrename])
        @label = Label.create(labelname: params[:labelname])
        @product = Product.new(product_params)

        @product.save
        redirect_to admin_products_path
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

    def product_params
        params.require(:product).permit(:label_id,:genre_id, :artist_id, :productname, :sale_status, :price, :image, genre_attribute: [:genrename], label_attribute: [:labelname], artist_attribute: [:artistsname])
    end

end