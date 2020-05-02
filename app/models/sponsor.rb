class Sponsor < ApplicationRecord
    # Relationships

    # Validations
    validates :image, presence: true

    # Uploaders
    mount_uploader :image, SponsorImageUploader

    # Methods
end
