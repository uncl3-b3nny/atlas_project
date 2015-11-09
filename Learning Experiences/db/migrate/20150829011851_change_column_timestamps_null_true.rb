class ChangeColumnTimestampsNullTrue < ActiveRecord::Migration
  def change
    change_column_null :factories, :created_at, true  
    change_column_null :factories, :updated_at, true  
    change_column_null :blueprints, :created_at, true  
    change_column_null :blueprints, :updated_at, true  
    change_column_null :catalogues, :created_at, true  
    change_column_null :catalogues, :updated_at, true  
    change_column_null :construction_schedules, :created_at, true  
    change_column_null :construction_schedules, :updated_at, true  
    change_column_null :factory_manufacturing_processes, :created_at, true  
    change_column_null :factory_manufacturing_processes, :updated_at, true  
    change_column_null :floorplans, :created_at, true  
    change_column_null :floorplans, :updated_at, true  
    change_column_null :labors, :created_at, true  
    change_column_null :labors, :updated_at, true  
    change_column_null :manufacturing_processes, :created_at, true  
    change_column_null :manufacturing_processes, :updated_at, true  
    change_column_null :quantities, :created_at, true  
    change_column_null :quantities, :updated_at, true
  end
end
