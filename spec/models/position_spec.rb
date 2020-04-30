require 'rails_helper'

RSpec.describe Position, type: :model do
  # Association test
  it { should have_many(:member_positions) }
  it { should have_many(:members)}
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
