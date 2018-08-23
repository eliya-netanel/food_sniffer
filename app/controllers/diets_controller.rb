class DietsController < ApplicationController
  def show
    @diets = current_user.diet
    @ingredients = Ingredient.all
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.user = current_user
    if @diet.save
      redirect_to user_diet_path
    else
      redirect_to new_diet_path
   end
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
    params.require(:diet).permit(:name, :user_id, :diet_id)
  end
end
