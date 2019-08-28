class Admin::ProductsController < ApplicationController
    before_action :admin_users

    def top
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to admin_products_path
    end

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
        @cart_product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to admin_product_path(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path
    end

    private

    def product_params
        params.require(:product).permit(:label_id,:genre_id, :artist_id, :stock_number, :productname, :sale_status, :price, :image, cds_attributes: [:id, :cdname, :_destroy, songs_attributes: [:id, :songname, :song_number, :_destroy]])
    end

    def admin_users
        redirect_to products_path unless current_user.admin?
    end
end