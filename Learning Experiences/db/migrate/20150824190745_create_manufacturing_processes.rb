class CreateManufacturingProcesses < ActiveRecord::Migration
  def change
    create_table :manufacturing_processes do |t|
      t.string :name

      t.timestamps
    end
  end
end
