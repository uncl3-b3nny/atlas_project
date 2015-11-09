class AddColumnCatalogueIdToDesigns < ActiveRecord::Migration
  def change
  add_column :designs, :blueprint_id,             :integer
  add_column :designs, :floorplan_id,             :integer
  add_column :designs, :manufacturing_process_id, :integer
  add_column :designs, :catalogue_id,             :integer #to do: rename catalogue to 'catalog'
  add_column :designs, :a5_id,                    :integer
  add_column :designs, :a4_id,                    :integer
  add_column :designs, :a3_id,                    :integer
  add_column :designs, :a2_id,                    :integer
  add_column :designs, :assembly_id,              :integer
  add_column :designs, :part_id,                  :integer
  add_column :designs, :raw_material_id,          :integer
  end
end
