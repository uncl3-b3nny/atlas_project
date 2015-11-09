class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.string :name
      t.integer :building_id

      t.timestamps
    end
  end
end
