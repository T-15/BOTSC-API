require 'rails_helper'

RSpec.describe Team, type: :model do
  # Association test
  it { should belong_to(:sponsor) }
  it { should belong_to(:convenor).class_name('Member').optional }
  it { should belong_to(:division) }
  it { should have_many(:team_members) }
  it { should have_many(:members) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
end
