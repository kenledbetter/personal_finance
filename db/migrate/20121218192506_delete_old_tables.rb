class DeleteOldTables < ActiveRecord::Migration
  def up
    drop_table :matches
    drop_table :raw_names
    change_table :entries do |t|
      t.rename :name, :original_name
      t.references :matched_name
      t.references :preferred_name
    end
  end

  def down
  end
end
