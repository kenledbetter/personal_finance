class UpdateEntries2 < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.remove :category_id
      t.remove :mapped_name_id
      t.remove :mapped_name_type
    end
  end
end
