class CreateConstructionSchedules < ActiveRecord::Migration
  def change
    create_table :construction_schedules do |t|
      t.integer :building_id
      t.integer :lot_id

      t.timestamps
    end
  end
end
