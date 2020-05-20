class SeasonSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :year, :name, :schedule_generated, :active
  # model association
  has_many :divisions
end
