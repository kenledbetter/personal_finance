class FinalName < ActiveRecord::Base
  belongs_to :category
  has_many :entries, :order => 'date'
  has_many :raw_to_final_name_mappings

  attr_accessible :name, :ignore, :category_id

  before_save :before_save_callback

  def merge_with(merge_name, merge_category_flag = false)
    # Stop and return now if self and merge_name are the same
    if (self.id == merge_name.id)
      return self
    end

    # Reassign all entries
    self.entries.each do |entry|
      entry.final_name = merge_name

      if (merge_category_flag)
        entry.category = merge_name.category
      end

      entry.save
    end

    # Reassign raw-to-final name mappings
    self.raw_to_final_name_mappings.each do |rtfn_mapping|
      rtfn_mapping.final_name = merge_name
      rtfn_mapping.save
    end

    # Delete the original entry
    self.destroy

    # Return merge_name
    return merge_name
  end

  def before_save_callback
    # Add to "Uncategorized" category if current one is nil
    if (self.category == nil)
      self.category = Category.find_or_create_by_name("Uncategorized")
    end
  end
end
