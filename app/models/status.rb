class Status < ApplicationRecord
    # Relationships
    has_many :matches
    has_many :members

    # Validations
    validates :name, presence: true

    # Scopes
    scope :get_applicant, -> { where(:name => 'Applicant') }
    scope :get_registered, -> { where(:name => 'Registered') }

    # Uploaders

    # Methods
end
