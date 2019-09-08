class UsersController < ApplicationController
    def index
        @users = User.all
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
        @addresses = Address.all
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(params[:id])
        else
            flash[:alert] = "住所の保存に失敗しました！"
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to products_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :name,:lastname, :name_kana,:lastname_kana, :tellnumber, addresses_attributes: [:id, :prefecture, :municipality, :building, :address_number, :_destroy])
    end
end
