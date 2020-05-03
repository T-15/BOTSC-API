class Match < ApplicationRecord
  # Relationships
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :field
  belongs_to :status

  # Validations
  validates :week, presence: true

  # Scopes
  scope :for_team, ->(team_id) { where("home_team_id = ? OR away_team_id = ?", team_id, team_id) }

  # Uploaders

  # Methods
end
