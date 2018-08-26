class AddProductNameToScans < ActiveRecord::Migration[5.2]
  def change
    add_column :scans, :product_name, :string
  end
end
