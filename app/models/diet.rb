class Diet < ApplicationRecord
  # belongs_to :user,
  # has_many :ingredients
  belongs_to :user, optional: true
  has_many :diet_ingredients
  has_many :ingredients, through: :diet_ingredients

  def check_product(ingredients) #if is vegetarian
    product_ingredients = ingredients.split(",")
    # result = @ingredients & product_ingredients

    # map/each! the array so its lowercase

    result_array = ["milk", "cheese", "meat", "egg"] & product_ingredients
    # compere both arrays, returns, result
    return true if result_array.empty?
  end

  private
end
