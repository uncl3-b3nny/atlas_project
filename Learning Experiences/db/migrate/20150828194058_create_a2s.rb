class CreateA2s < ActiveRecord::Migration
  def change
    create_table :a2s do |t|

      t.timestamps #null: true
    end
  end
end
