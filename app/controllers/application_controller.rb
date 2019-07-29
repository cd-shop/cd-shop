class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def after_sign_in_path_for(resource)
        practices_index_path
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :email, :tellnumber])
    end
end

