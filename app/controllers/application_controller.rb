class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:another]

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :header_name

    protected
    def after_sign_in_path_for(resource)
        if current_user.admin?
            admin_top_path
        else
            products_path
        end
    end

    def after_sign_out_path_for(resource)
        products_path
    end
 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :name_kana, :lastname_kana, :email, :tellnumber])
    end

    def header_name
        if user_signed_in?
			@header_name = current_user.name
		else
			@header_name = "ゲスト"
        end
    end
end