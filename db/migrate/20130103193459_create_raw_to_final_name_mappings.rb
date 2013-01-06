class CreateRawToFinalNameMappings < ActiveRecord::Migration
  def change
    create_table :raw_to_final_name_mappings do |t|
      t.string :name
      t.references :account
      t.references :final_name

      t.timestamps
    end
    add_index :raw_to_final_name_mappings, :account_id
    add_index :raw_to_final_name_mappings, :final_name_id
  end
end
