class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to welcome_path, notice: 'You need to sign in or sign up before continuing.'
    end
  end
end
