class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.integer :lot_id
      t.integer :building_id
      t.integer :part_id
      t.integer :assembly_id

      t.timestamps 
    end
  end
end
