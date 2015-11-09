class AddColumnQuantityIdToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :quantity_id, :integer
  end
end
