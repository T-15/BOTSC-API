class MemberService < ApplicationRecord
    # Relationships

    # Validations
    validates :name,           presence: true
    validates :contact_name,   presence: true

    # Uploaders
    mount_uploader :image, MemberServiceImageUploader

    # Methods
end
