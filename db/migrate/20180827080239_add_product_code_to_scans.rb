class AddProductCodeToScans < ActiveRecord::Migration[5.2]
  def change
    add_column :scans, :product_code, :string
  end
end
