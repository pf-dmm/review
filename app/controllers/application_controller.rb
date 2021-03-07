class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
        case resource
          when Admin
            root_path
        end
      portfolios_path
    end

    def after_sign_out_path_for(resource)
        case resource
          when :admin
            new_admin_session_path
        end
      portfolios_path
    end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
