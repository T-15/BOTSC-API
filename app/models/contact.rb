class Contact < ApplicationRecord
    # Relationships
    belongs_to :member

    # Validations
    validates :name, presence: true
    validates :phone, presence: true

    # Scopes

    # Uploaders

    # Methods
end
