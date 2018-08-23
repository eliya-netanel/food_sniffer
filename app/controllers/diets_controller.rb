class DietsController < ApplicationController
  def show
    @diet = current_user.diet
    @ingredients = Ingredient.all
    @black_list = @diet.ingredients
    @not_blacklisted = @ingredients - @black_list
  # end
end
  def new
    @diet = Diet.new
  end

  def create
    template_diet = Diet.find_by_name(params[:diet_name])
    diet = Diet.new
    diet.user = current_user
    diet.ingredients = template_diet.ingredients
    if diet.save
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
