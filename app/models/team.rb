class Team < ApplicationRecord
    # Relationships
    belongs_to :sponsor
    belongs_to :division
    belongs_to :convenor, class_name: 'Member', optional: true
    has_many :team_members
    has_many :members, through: :team_members

    # Validations
    validates :name, presence: true

    # Scopes

    # Uploaders
    mount_uploader :jersey_image, JerseyImageUploader
    mount_uploader :team_image, TeamImageUploader

    # Methods
end
