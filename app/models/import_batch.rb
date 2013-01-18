class ImportBatch < ActiveRecord::Base
  has_many :entries, :order => 'date'
end
