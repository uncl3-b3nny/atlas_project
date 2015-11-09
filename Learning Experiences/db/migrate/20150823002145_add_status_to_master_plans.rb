class AddStatusToMasterPlans < ActiveRecord::Migration
  def change
    add_column  :master_plans, :status, :string
  end
end
