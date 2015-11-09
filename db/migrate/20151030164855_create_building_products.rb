class CreateBuildingProducts < ActiveRecord::Migration
  def change
    create_table :building_products do |t|
      t.integer :building_id
      t.integer :product_id
      t.integer :quantity

    end
  end
end
