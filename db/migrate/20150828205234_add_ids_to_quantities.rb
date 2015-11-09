class AddIdsToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :quantity, :integer
    add_column :quantities, :building_id, :integer
    add_column :quantities, :assembly_id, :integer
    add_column :quantities, :a2_id, :integer
    add_column :quantities, :a3_id, :integer
    add_column :quantities, :a4_id, :integer
    add_column :quantities, :a5_id, :integer
    add_column :quantities, :part_id, :integer
    add_column :quantities, :raw_material_id, :integer
    add_column :quantities, :milestone_id, :integer
    add_column :quantities, :labor_id, :integer
    add_column :quantities, :inventory_id, :integer
    add_column :quantities, :credit_id, :integer
    add_column :quantities, :debt_id, :integer
    add_column :quantities, :participant_id, :integer
  end
end
