class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :final_name

  attr_accessor :final_name_form
  attr_accessible :raw_name, :amount, :date, :account_id

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

      self.final_name = rtfnMapping.final_name
    end
  end
end
