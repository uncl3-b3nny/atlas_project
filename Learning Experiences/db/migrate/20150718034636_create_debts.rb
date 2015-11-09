class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|

      t.timestamps
    end
  end
end
