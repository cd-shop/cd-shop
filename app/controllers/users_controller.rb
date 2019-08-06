class UsersController < ApplicationController
      
    def show
        @user = User.find(params[:id])
        @users = User.all
        # if @user.admin == "true"
        #     @admin = "true"
        # else
    
        # end
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
        params.require(:user).permit(:email, :name, :name_kane, :tellnumber)
    end
end
