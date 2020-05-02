require 'rails_helper'

RSpec.describe WaitingListMember, type: :model do
  # Association test
  it { should belong_to(:waiting_list) }
  it { should belong_to(:member) }
  # Validation tests
  # ensure columns are present before saving
end
