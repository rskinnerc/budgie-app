class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Group.find(params[:category_id])
    @groups = current_user.groups
  end

  def create
    @operation = Operation.new(name: operation_params[:name], amount: operation_params[:amount], user: current_user)
    @operation.groups << operation_params[:groups].map { |id| Group.find(id) }
    if @operation.save
      flash[:notice] = 'Operation was successfully created.'
      redirect_to category_path(@operation.groups.first)
    else
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, groups: [])
  end
end
