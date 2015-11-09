class AddColumnApprovedToAppropriateModels < ActiveRecord::Migration
  def change
    add_column :lots, :approved, :boolean
    add_column :buildings, :approved, :boolean

    # The following should all have quantities that are approved
      # add_column :a5, :approved, :boolean
      # add_column :a4, :approved, :boolean
      # add_column :a3, :approved, :boolean
      # add_column :a2, :approved, :boolean
      # add_column :assemblies, :approved, :boolean
      # add_column :parts, :approved, :boolean
      # add_column :raw_materials, :approved, :boolean
      # add_column :labor, :approved, :boolean
    add_column :floorplans, :approved, :boolean
    add_column :blueprints, :approved, :boolean
    add_column :catalogues, :approved, :boolean
    add_column :construction_schedules, :approved, :boolean
    add_column :milestones, :approved, :boolean
    add_column :regions, :approved, :boolean
    add_column :master_plans, :approved, :boolean
    add_column :developments, :approved, :boolean
    add_column :deeds, :approved, :boolean
    add_column :factories, :approved, :boolean
    add_column :manufacturing_processes, :approved, :boolean
    add_column :participants, :approved, :boolean
    add_column :quantities, :approved, :boolean
    add_column :tools, :approved, :boolean
  end
end
