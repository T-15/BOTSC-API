class DivisionSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :active
  # model association
  belongs_to :season
  has_many :teams
end
