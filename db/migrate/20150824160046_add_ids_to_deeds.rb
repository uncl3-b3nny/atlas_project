class AddIdsToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :participant_id, :integer
    add_column :deeds, :building_id, :integer
  end
end
