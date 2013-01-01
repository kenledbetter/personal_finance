class MatchedName < ActiveRecord::Base
  belongs_to :preferred_name
  attr_accessible :name, :preferred_name_id
end
