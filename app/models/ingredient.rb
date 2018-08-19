class Ingredient < ApplicationRecord
  has_many :food_item_ingredients
  has_many :diet_ingredients
end
