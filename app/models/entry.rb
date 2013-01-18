class Entry < ActiveRecord::Base
  default_scope order('date')

  belongs_to :account
  belongs_to :final_name
  belongs_to :category
  belongs_to :import_batch

  attr_accessor :final_name_form
  attr_accessible :raw_name, :amount, :date, :account_id, :category_id, :import_batch_id, :comment

  before_save :before_save_callback

  def before_save_callback
    # If final_name is nil, try to match through raw-to-final name mapping
    if (self.final_name == nil)
      rtfnMapping = RawToFinalNameMapping.find_or_create_by_name_and_account_id(
        self.raw_name,  self.account_id)

      # Create new final_name from raw_name if no current mapping exists
      if (rtfnMapping.final_name == nil)
        final_name = FinalName.find_or_create_by_name(self.raw_name)
        rtfnMapping.final_name = final_name
        rtfnMapping.save
      end

      # Assign final name to entry
      self.final_name = rtfnMapping.final_name

      # If entry category is nil, assign category from final_name
      if (self.category == nil)
        self.category = rtfnMapping.final_name.category
      end
    end
  end
end
