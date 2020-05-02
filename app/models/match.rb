class Match < ApplicationRecord
  # Relationships
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :field
  belongs_to :status

  # Validations
  validates :number, presence: true

  # Scopes

  # Uploaders

  # Methods
end
