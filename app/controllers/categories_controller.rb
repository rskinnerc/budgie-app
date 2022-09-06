class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.groups
  end

  def show; end

  def new; end
end
