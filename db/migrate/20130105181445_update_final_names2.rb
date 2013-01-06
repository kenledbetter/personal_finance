class UpdateFinalNames2 < ActiveRecord::Migration
  def up
    change_table :final_names do |t|
      t.remove :categories_id
    end

    drop_table :matched_names
    drop_table :preferred_names
  end

  def down
  end
end
