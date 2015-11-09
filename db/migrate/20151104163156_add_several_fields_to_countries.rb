class AddSeveralFieldsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :upkeep_cost_of_means_of_production,       :integer
    add_column :countries, :cost_of_means_of_production,              :integer
    add_column :countries, :market_price,                             :integer
    add_column :countries, :market_bulk_discount,                     :integer
    add_column :countries, :additional_discount_needed_to_close_deal, :integer
  end
end
