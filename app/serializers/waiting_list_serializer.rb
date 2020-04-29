class WaitingListSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name
  # model association
  has_one :division
end
