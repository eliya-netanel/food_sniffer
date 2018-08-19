class CreateFoodItemIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :food_item_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :food_item, foreign_key: true

      t.timestamps
    end
  end
end
