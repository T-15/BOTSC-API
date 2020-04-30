require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  # Association test
  it { should belong_to(:team) }
  it { should belong_to(:member) }
  # Validation tests
  # ensure columns are present before saving
end
