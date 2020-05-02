require 'rails_helper'

RSpec.describe Member, type: :model do
  # Association test
  it { should belong_to(:shirt_size).class_name('Size').optional }
  it { should belong_to(:short_size).class_name('Size').optional }
  it { should belong_to(:referral_method).optional }
  it { should belong_to(:status) }
  it { should have_many(:team_members) }
  it { should have_many(:teams) }
  it { should have_many(:member_positions) }
  it { should have_many(:positions) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:birthday) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_presence_of(:member_since) }
end
