class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :development_id
      t.string :status
      
      t.timestamps
    end
  end
end
