class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def notification
    @review_to_me = PfReview.where(reviewed_user_id: current_user)
  end

  def after_sign_up_path_for(resource)
      case resource
        when Admin
          admin_portfolios_path
      end
    new_portfolios_path
  end

  def after_sign_in_path_for(resource)
        case resource
          when Admin
            admin_portfolios_path
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

  def configure_post
    redirect_to new_portfolio_path unless current_user.present? && current_user.portfolio.present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
