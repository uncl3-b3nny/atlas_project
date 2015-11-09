class CorrectSeveralDifferentTablesAndAttributes < ActiveRecord::Migration
  def change
    add_column :deeds, :development_id, :integer
    remove_column :deeds, :building_id
    add_column :lots, :deed_id, :integer
    add_column :buildings, :lot_id, :integer
    add_column :buildings, :deed_id, :integer
  end
end
