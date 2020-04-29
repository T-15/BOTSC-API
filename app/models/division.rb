class Division < ApplicationRecord
  # Relationships
  belongs_to :season
  has_many :teams
  has_one :waiting_list

  # Validations
  validates :name, presence: true

  # Scopes

  # Uploaders

  # Methods
end
