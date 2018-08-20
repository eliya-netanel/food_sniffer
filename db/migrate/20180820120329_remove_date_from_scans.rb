class RemoveDateFromScans < ActiveRecord::Migration[5.2]
  def change
    remove_column :scans, :date, :Date
  end
end
