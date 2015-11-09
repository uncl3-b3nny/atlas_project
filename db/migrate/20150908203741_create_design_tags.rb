class CreateDesignTags < ActiveRecord::Migration
  def change
    create_table :design_tags do |t|
      t.integer :design_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
