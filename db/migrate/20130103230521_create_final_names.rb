class CreateFinalNames < ActiveRecord::Migration
  def change
    create_table :final_names do |t|
      t.string :name
      t.references :categories

      t.timestamps
    end
    add_index :final_names, :categories_id
  end
end
