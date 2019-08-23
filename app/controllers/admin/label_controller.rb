class Admin::LabelController < ApplicationController
    def new
        @label = Label.new
    end

    def create
        label = Label.new(label_params)
        label.save
        redirect_to new_admin_product_path
    end

    private

    def label_params
        params.require(:label).permit(:id, :labelname)
    end

    def admin_users
        redirect_to products_path unless current_user.admin?
    end
end
