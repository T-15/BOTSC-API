class SeasonSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :year, :name
  # model association
  has_many :divisions
end
