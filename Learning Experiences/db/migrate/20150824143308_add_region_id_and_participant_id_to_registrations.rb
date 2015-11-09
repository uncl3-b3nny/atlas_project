class AddRegionIdAndParticipantIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :region_id, :integer
    add_column :registrations, :participant_id, :integer
  end
end
