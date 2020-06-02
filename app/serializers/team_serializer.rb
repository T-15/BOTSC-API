class TeamSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :convenor_id, :division_id, :sponsor_id, :name, :jersey_image, :team_image, :draft_position, :active
  # model association
  belongs_to :division
  belongs_to :sponsor
  belongs_to :convenor
  has_many :members
end
