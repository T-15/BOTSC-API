class Field < ApplicationRecord
    # Relationships

    # Validations
    validates :name,            presence: true
    validates :google_maps_url, presence: true

    # Uploaders

    # Methods
end
