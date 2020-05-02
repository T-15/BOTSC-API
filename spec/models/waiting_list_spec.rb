require 'rails_helper'

RSpec.describe WaitingList, type: :model do
  # Association test
  it { should belong_to(:division) }
  it { should have_many(:waiting_list_members) }
  it { should have_many(:members) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
