class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|

      t.timestamps
    end
  end
end
