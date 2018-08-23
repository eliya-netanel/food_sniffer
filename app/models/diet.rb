class Diet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :diet_ingredients
  has_many :ingredients, through: :diet_ingredients, dependent: :destroy
end
