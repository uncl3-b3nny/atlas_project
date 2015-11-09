class AddColumnDesignIdToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :design_id, :integer
  end
end
