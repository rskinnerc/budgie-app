class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = current_user.groups.find(params[:category_id])
    @groups = current_user.groups
    @operation = Operation.new
  end

  def create
    @category = current_user.groups.find(params[:category_id])
    @groups = current_user.groups
    @operation = Operation.new(name: operation_params[:name], amount: operation_params[:amount], user: current_user)

    if operation_params[:groups].nil?
      flash[:notice] = 'You must select at least one category.'
      render :new, status: :unprocessable_entity
      return
    end

    @operation.groups << operation_params[:groups].map { |id| Group.find(id) }
    if @operation.save
      flash[:notice] = 'Operation was successfully created.'
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, groups: [])
  end
end
