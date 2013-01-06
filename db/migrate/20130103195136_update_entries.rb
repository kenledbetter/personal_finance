class UpdateEntries < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.rename :original_name, :raw_name
      t.remove :category
      t.remove :mapped_name
      t.references :final_name
    end
  end

  def down
  end
end
