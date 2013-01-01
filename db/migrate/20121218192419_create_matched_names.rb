class CreateMatchedNames < ActiveRecord::Migration
  def change
    create_table :matched_names do |t|
      t.string :name
      t.references :preferred_name

      t.timestamps
    end
    add_index :matched_names, :preferred_name_id
  end
end
