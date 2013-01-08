class UpdateEntries4 < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.references :import_batch
    end
  end

  def down
    change_table :entries do |t|
      t.remove :import_batch_id
    end
  end
end
