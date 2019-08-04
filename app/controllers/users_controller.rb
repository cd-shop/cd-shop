class UsersController < ApplicationController
      
    def show
        @user = User.find(params[:id])
        @users = User.all
    end
    
    def index
        @user = User.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.save
        redirect_to user_path(params[:id])
    end

    def destroy
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :name, :name_kane, :tellnumber)
    end
end
