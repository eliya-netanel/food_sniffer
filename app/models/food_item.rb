class FoodItem < ApplicationRecord
  has_many :scans
  has_many :food_item_ingredients
end
