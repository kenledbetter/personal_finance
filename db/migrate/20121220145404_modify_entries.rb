class ModifyEntries < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.remove matched_name_id
      t.remove preferred_name_id
      t.references :mapped_name, :polymorphic => true
    end
  end

  def down
  end
end
