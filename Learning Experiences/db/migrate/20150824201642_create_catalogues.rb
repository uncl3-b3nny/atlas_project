class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.string :name
      t.string :region_id

      t.timestamps
    end
  end
end
