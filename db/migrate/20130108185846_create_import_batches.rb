class CreateImportBatches < ActiveRecord::Migration
  def change
    create_table :import_batches do |t|

      t.timestamps
    end
  end
end
