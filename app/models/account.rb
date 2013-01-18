class Account < ActiveRecord::Base
  has_many :entries, :order => 'date'

  attr_accessible :name
end
