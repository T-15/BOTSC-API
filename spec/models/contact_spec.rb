require 'rails_helper'

RSpec.describe Contact, type: :model do
  # Association test
  it { should belong_to(:member)}
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:phone) }
end
