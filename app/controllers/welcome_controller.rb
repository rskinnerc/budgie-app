class WelcomeController < ApplicationController
  before_action :check_auth

  def index; end

  private

  def check_auth
    return unless user_signed_in?

    flash[:notice] = 'You are already signed in.'
    redirect_to root_path
  end
end
