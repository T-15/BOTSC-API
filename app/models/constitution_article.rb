class ConstitutionArticle < ApplicationRecord
    # Relationships

    # Validations
    validates :title,   presence: true
    validates :content, presence: true

    # Uploaders

    # Methods
    acts_as_list scope: [:active], :add_new_at => :bottom
    before_destroy { |record| record.remove_from_list }
end
