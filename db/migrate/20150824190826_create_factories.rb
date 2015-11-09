class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.string :name
      t.integer :region_id

      t.timestamps
    end
  end
end
