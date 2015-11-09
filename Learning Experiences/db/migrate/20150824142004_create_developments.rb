class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.string :name
      t.integer :masterplan_id

      t.timestamps
    end
  end
end
