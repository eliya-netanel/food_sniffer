class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.references :user, foreign_key: true
      t.references :food_item, foreign_key: true
      t.string :date
      t.boolean :result

      t.timestamps
    end
  end
end
