require 'rails_helper'

RSpec.describe Size, type: :model do
  # Association test
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
