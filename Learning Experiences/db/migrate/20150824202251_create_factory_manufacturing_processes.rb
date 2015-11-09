class CreateFactoryManufacturingProcesses < ActiveRecord::Migration
  def change
    create_table :factory_manufacturing_processes do |t|
      t.integer :factory_id
      t.integer :manufacturing_process_id

      t.timestamps
    end
  end
end
