require 'rails_helper'

RSpec.describe Match, type: :model do
  # Association test
  it { should belong_to(:home_team) }
  it { should belong_to(:away_team) }
  it { should belong_to(:field) }
  it { should belong_to(:status) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:number) }
end
