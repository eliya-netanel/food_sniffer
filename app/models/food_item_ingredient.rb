class FoodItemIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :food_item
end
