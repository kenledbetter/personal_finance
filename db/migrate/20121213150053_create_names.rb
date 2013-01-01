class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :raw
      t.references :match

      t.timestamps
    end
    add_index :names, :match_id
  end
end
