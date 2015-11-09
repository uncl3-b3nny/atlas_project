class CreateProductRawMaterials < ActiveRecord::Migration
  def change
    create_table :product_raw_materials do |t|
      t.integer :raw_material_id
      t.integer :building_product_id
      t.integer :quantity

    end
  end
end
