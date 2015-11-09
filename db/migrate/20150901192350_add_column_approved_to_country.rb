class AddColumnApprovedToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :approved, :boolean
  end
end
