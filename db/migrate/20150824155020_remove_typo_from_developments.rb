class RemoveTypoFromDevelopments < ActiveRecord::Migration
  def change
    remove_column :developments, :masterplan_id
    add_column :developments, :master_plan_id, :integer
  end
end
