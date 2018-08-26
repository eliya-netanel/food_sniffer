class DietsController < ApplicationController
  def show
    @diet = current_user.diet

    #Will be the template ingredients as we established in the create action
    @black_list = @diet.ingredients
    @ingredients = Ingredient.all
    #The rest of the ingredients will follow that wasn't black listed.
    @not_blacklisted = @ingredients - @black_list

end
  def new
    @diet = Diet.new
  end

  def create
    #Finding the specific diet with params that we made in the html
    Diet.where(user: current_user).destroy_all
    template_diet = Diet.find_by_name(params[:diet_name])
    diet = Diet.new
    diet.user = current_user
    #The set ingredients of the template will be pushed to my diet.
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
