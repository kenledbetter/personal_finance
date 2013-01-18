class Category < ActiveRecord::Base
  has_many :final_names, :order => 'lower(name)'
  has_many :entries, :order => 'date'

  attr_accessible :name, :ignore
end
