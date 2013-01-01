class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.decimal :amount
      t.datetime :date
      t.references :account

      t.timestamps
    end
    add_index :entries, :account_id
  end
end
