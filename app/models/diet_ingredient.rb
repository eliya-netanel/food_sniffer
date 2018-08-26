class DietIngredient < ApplicationRecord
  belongs_to :diet
  belongs_to :ingredient
end
