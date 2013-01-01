class CreatePreferredNames < ActiveRecord::Migration
  def change
    create_table :preferred_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
