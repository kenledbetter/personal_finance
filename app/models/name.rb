class Name < ActiveRecord::Base
  belongs_to :match
  attr_accessible :raw
end
