class AddColumnNameToA5s < ActiveRecord::Migration
  def change
    add_column :a5s, :name, :string
    add_column :a4s, :name, :string
    add_column :a3s, :name, :string
    add_column :a2s, :name, :string
  end
end
