class CreateNaturalResources < ActiveRecord::Migration
  def change
    create_table :natural_resources do |t|
      t.integer :name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
