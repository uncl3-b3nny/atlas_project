class AddColumnEngineeringApprovalToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :engineering_approved, :boolean
  end
end
