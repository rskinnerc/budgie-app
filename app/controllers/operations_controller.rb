class OperationsController < ApplicationController
  def new
    @category = Group.find(params[:category_id])
  end

  def create; end
end
