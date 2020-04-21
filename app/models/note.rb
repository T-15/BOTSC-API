class Note < ApplicationRecord
  # Relationships
  belongs_to :member
  # Validations
  validates :content, presence: true

  # Scopes

  # Uploaders

  # Methods
end
