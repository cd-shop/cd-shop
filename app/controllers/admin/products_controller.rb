class Admin::ProductsController < ApplicationController
    def new
        @pd = Product.new
        @pd.build_genre
        @pd.build_label
        @pd.build_artist
        render :layout => nil
    end
    def create
        @pd = Product.new(product_params)
        @pd.save
    end 
    private 
    def product_params
        params.require(:product).permit(:price, :productname, :stock_number, genres_attributes:[:id, :genrename], labels_attributes:[:id, :labelname], artists_attributes:[:id, :artistname], cds_attributes:[:id, :cdname], songs_attributes:[:id, :songname])
    end
end
