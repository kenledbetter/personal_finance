class DeleteNames < ActiveRecord::Migration
  def up
    drop_table :names
  end

  def down
    create_table :names do |t|
      t.string :raw
      t.references :match

      t.timestamps
    end
    add_index :names, :match_id
  end
end
