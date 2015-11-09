class ChangeBuildingType < ActiveRecord::Migration
  def change
    remove_column :buildings, :type, :string
    add_column :buildings, :building_type, :string
  end
end
