class RawName < ActiveRecord::Base
  belongs_to :match
  attr_accessible :name
end
