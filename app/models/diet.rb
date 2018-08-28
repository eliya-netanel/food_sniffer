# require 'pr'
class Diet < ApplicationRecord
  # belongs_to :user,
  # has_many :ingredients
  belongs_to :user, optional: true
  has_many :diet_ingredients
  has_many :ingredients, through: :diet_ingredients, dependent: :destroy


  def self.new_from_template(name)
    template_diet = Diet.where(user_id: nil, name: name).first
    diet = Diet.new
    diet.name = template_diet.name
    #The set ingredients of the template will be pushed to my diet.
    diet.ingredients = template_diet.ingredients
    return diet
  end

  def check_ingredients(other_ingredients)
    # binding.pry
    (ingredients.map(&:name) & other_ingredients).empty?
  end

#   def check_product(ingredients) #if is vegetarian
#     product_ingredients = ingredients.split(",")
#     product_ingredients.map! { |ingredient| ingredient.strip! }
#     # raise
#     # result = @ingredients & product_ingredients

#     # map/each! the array so its lowercase
# # diet.where(:user = current_user)
#     result_array = ["milk"] & product_ingredients
#     # compere both arrays, returns, result
#     # raise
#     return true if result_array.empty?
#   end

  private

end
