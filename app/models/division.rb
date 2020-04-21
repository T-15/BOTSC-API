class Division < ApplicationRecord
  # Relationships
  belongs_to :season
  has_many :teams

  # Validations
  validates :name, presence: true

  # Scopes

  # Uploaders

  # Methods
end
