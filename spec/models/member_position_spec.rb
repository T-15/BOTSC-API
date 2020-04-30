require 'rails_helper'

RSpec.describe MemberPosition, type: :model do
  # Association test
  it { should belong_to(:member) }
  it { should belong_to(:position) }
  # Validation tests
  # ensure columns are present before saving
end
