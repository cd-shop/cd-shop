class Admin::UsersController < ApplicationController
    before_action :admin_users
    def index
        @users = User.with_deleted
    end

    def show
        @user = User.with_deleted.find(params[:id])
    end

    def  edit
    end

    def update
    end

    def destroy
    end

    private
    def admin_users
        redirect_to products_path unless current_user.admin?
    end
end

