class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_items, :type, :type_of
    rename_column :ingredients, :type, :type_of
  end
end
