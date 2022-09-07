class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.groups
  end

  def show
    @category = current_user.groups.find(params[:id])
    @operations = @category.operations
  end

  def new; end

  def create
    @category = current_user.groups.build(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
