class UpdateEntries3 < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.references :category
      t.text :comment
    end
  end

  def down
    change_table :entries do |t|
      t.remove :category_id
      t.remove :comment
    end
  end
end
