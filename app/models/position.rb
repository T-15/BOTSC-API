class Position < ApplicationRecord
    # Relationships
    has_many :member_positions
    has_many :members, through: :member_positions

    # Validations
    validates :name, presence: true

    # Scopes
    scope :active, -> { where(:active => true) }

    # Uploaders

    # Methods
end
