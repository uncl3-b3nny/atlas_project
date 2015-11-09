class CreateA4s < ActiveRecord::Migration
  def change
    create_table :a4s do |t|

      t.timestamps
    end
  end
end
