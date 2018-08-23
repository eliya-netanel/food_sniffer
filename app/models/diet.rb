class Diet < ApplicationRecord
  belongs_to :user
  has_many :ingredients


  private
  def check_product(ingredients) #if is vegetarian
    product_ingredients = ingredients.split(",")
    # result = @ingredients & product_ingredients
    result = ["milk", "cheese"] & product_ingredients
    # compere both arrays, returns, result
  end
end
