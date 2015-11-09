class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :design_id
      t.string :category_name

      t.timestamps
    end
  end
end
