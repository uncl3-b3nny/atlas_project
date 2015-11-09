class CreateMasterPlans < ActiveRecord::Migration
  def change
    create_table :master_plans do |t|
      t.string :name
      t.integer :region_id

      t.timestamps 
    end
  end
end
