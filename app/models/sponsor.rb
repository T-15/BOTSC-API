class Sponsor < ApplicationRecord
    # Relationships

    # Validations

    # Uploaders
    mount_uploader :image, SponsorImageUploader

    # Methods
end
