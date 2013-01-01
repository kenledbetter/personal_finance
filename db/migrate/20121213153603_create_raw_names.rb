class CreateRawNames < ActiveRecord::Migration
  def change
    create_table :raw_names do |t|
      t.string :name
      t.references :match

      t.timestamps
    end
    add_index :raw_names, :match_id
  end
end
