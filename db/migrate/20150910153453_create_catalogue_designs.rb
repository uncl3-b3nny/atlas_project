class CreateCatalogueDesigns < ActiveRecord::Migration
  def change
    create_table :catalogue_designs do |t|
      t.integer :catalogue_id
      t.integer :design_id

    end
  end
end
