class CreateAtlasRegistrations < ActiveRecord::Migration
  def change
    create_table :atlas_registrations do |t|

      t.timestamps 
    end
  end
end
