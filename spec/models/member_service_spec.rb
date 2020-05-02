require 'rails_helper'

RSpec.describe MemberService, type: :model do
  # Association test
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:contact_name) }
end
