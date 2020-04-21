class Member < ApplicationRecord
    # Relationships
    # has_many :teams, foreign_key: "convenor_id"
    belongs_to :shirt_size, class_name: 'Size', optional: true
    belongs_to :short_size, class_name: 'Size', optional: true
    belongs_to :referral_method, optional: true
    belongs_to :status
    has_many :team_members
    has_many :teams, through: :team_members

    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birthday, presence: true
    validates :postal_code, presence: true

    # Scopes

    # Uploaders
    mount_uploader :image, MemberImageUploader

    # Methods
    def full_name
        name = self.first_name + " " + self.last_name
        return name
    end

    def full_name_html_safe
        return self.full_name.html_safe
    end
end
