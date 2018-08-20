class AddDateToScans < ActiveRecord::Migration[5.2]
  def change
    add_column :scans, :date, :date
  end
end
