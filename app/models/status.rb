class Status < ApplicationRecord
    # Relationships

    # Validations
    validates :name, presence: true

    # Scopes

    # Uploaders

    # Methods
    def get_applicant
        return Status.find_by(name: 'Applicant')
    end

    def get_registered
        return Status.find_by(name: 'Registered')
    end
end
