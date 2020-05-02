require 'rails_helper'

RSpec.describe ConstitutionArticle, type: :model do
  # Association test
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:content) }
end
