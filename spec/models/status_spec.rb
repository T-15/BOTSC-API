require 'rails_helper'

RSpec.describe Status, type: :model do
  # Association test
  it { should have_many(:matches) }
  it { should have_many(:members) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
