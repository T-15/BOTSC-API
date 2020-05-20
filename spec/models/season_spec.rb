require 'rails_helper'

RSpec.describe Season, type: :model do
  # Association test
  it { should have_many(:divisions) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:year) }
  it { should validate_uniqueness_of(:year) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
