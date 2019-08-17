class UsersController < ApplicationController
    def index
        @users = User.all
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @users = User.all
        if @user.id == 6
            redirect_to products_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to products_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :name, :lastname, :name_kane, :lastname_kana, :tellnumber)
    end
end