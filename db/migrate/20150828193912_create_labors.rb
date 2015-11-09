class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|

      t.timestamps
    end
  end
end
