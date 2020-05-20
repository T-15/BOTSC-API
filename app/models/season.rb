class Season < ApplicationRecord
    # Relationships
    has_many :divisions

    # Validations
    validates :year, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validate :only_one_active_season

    # Scopes
    scope :active, -> { where(:active => true) }

    # Uploaders

    # Methods
    protected

    def only_one_active_season
        return unless active?

        matches = Season.active
        if persisted?
            matches = matches.where('id != ?', id)
        end
        if matches.exists?
            errors.add(:active, 'cannot have another active Season')
        end
    end
end
