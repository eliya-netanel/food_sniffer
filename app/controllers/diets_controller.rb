class DietsController < ApplicationController
  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.user = current_user
    if @diet.save
      redirect_to scans_new_path
    else
      render :new
  end

  def edit
    @diet = current_user.find(params[:id])
  end

  def update
    @diet = current_user.find(params[:id])
    @diet.update(diet_parms)
  end

  private

  def diet_params
    params.require(:diet).permit(:name, :user_id)
  end
end
