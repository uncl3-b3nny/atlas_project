class AddColumnRegionIdToRawMaterials < ActiveRecord::Migration
  def change
    add_column :raw_materials, :region_id, :integer
  end
end
