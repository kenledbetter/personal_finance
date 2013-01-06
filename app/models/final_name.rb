class FinalName < ActiveRecord::Base
  belongs_to :category
  has_many :entries

  attr_accessible :name, :ignore, :category_id

  before_save :before_save_callback

  def before_save_callback
    # Add to "Uncategorized" category if current one is nil
    if (self.category == nil)
      self.category = Category.find_or_create_by_name("Uncategorized")
    end
  end
end
