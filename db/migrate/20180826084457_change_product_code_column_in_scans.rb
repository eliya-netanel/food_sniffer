class ChangeProductCodeColumnInScans < ActiveRecord::Migration[5.2]
  def change
    rename_column :scans, :product_code, :ingredients
  end
end
