class AddColumnQuantityIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :quantity_id, :integer
  end
end
