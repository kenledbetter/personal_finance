class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  belongs_to :matched_name
  belongs_to :preferred_name
  attr_accessible :amount, :date, :original_name, :account_id, :category_id, :matched_name_id, :preferred_name_id
end
