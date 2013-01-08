class Category < ActiveRecord::Base
  attr_accessible :name, :ignore
  has_many :final_names
  has_many :entries
end
