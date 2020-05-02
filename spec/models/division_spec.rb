require 'rails_helper'

RSpec.describe Division, type: :model do
  # Association test
  it { should belong_to(:season) }
  it { should have_many(:teams) }
  it { should have_one(:waiting_list) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
