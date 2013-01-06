class FixEntries < ActiveRecord::Migration
  def up
    change_column :entries, :amount, :decimal, :precision => 15, :scale => 2
  end

  def down
    change_column :entries, :amount, :decimal
  end
end
