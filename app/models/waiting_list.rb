class WaitingList < ApplicationRecord
  # Relationships
  belongs_to :division
  has_many :waiting_list_members
  has_many :members, through: :waiting_list_members

  # Validations
  validates :name, presence: true

  # Scopes

  # Uploaders

  # Methods
end
