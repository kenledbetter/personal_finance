class AddCategoriesToEntries < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.integer :category_id
    end
  end

  def down
    change_table :entries do |t|
      t.remove :category_id
    end
  end
end
