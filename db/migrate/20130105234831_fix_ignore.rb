class FixIgnore < ActiveRecord::Migration
  def up
    change_table :final_names do |t|
      t.remove :ignore
    end

    change_table :categories do |t|
      t.boolean :ignore, :default => false
    end
  end

  def down
    change_table :final_names do |t|
      t.boolean :ignore
    end

    change_table :categories do |t|
      t.remove :ignore
    end
  end
end
