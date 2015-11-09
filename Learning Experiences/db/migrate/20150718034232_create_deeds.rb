class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|

      t.timestamps
    end
  end
end
