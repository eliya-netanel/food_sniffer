class DietsController < ApplicationController
  def show
    @diet = current_user.diet

    #getting the type_of from the ingredeints table
    # @black_list_by_category = {}
    # @diet.ingredients.each do |ingredient|
    #   @black_list_by_category[ingredient.type_of] ||= []
    #   @black_list_by_category[ingredient.type_of] << ingredient
    # end

    @black_list_by_category = @diet.ingredients.group_by {|i| i.type_of }
    # @black_list_by_category = @diet.ingredients.group_by(&:type_of)


    # {
    #   "vegan": [Ingredient1, Ingredient2]
    # }

    # a ||= b

    # if a.nil?
    #   a = b
    # end


    # @black_list = @diet.ingredients
    # @ingredients = Ingredient.all
    # #The rest of the ingredients will follow that wasn't black listed.
    # @not_blacklisted = @ingredients - @black_list
    # @info =

end
  def new
    @diet = Diet.new
  end

  def create
    #Finding the specific diet with params that we made in the html
    Diet.where(user: current_user).destroy_all
    diet = Diet.new_from_template(params[:diet_name])
    diet.user = current_user
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
