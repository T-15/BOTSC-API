require 'rails_helper'

RSpec.describe Api::V1::Sponsor, type: :model do
  # Association test
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:image) }
end
