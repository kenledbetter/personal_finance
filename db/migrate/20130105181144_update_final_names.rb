class UpdateFinalNames < ActiveRecord::Migration
  def up
    change_table :final_names do |t|
      t.remove :categories
      t.references :category
      t.boolean :ignore
    end
  end

  def down
  end
end
