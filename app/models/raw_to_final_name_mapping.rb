class RawToFinalNameMapping < ActiveRecord::Base
  belongs_to :account
  belongs_to :final_name
  attr_accessible :name
end
