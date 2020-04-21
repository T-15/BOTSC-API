class FieldSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :google_maps_url
  # model association
end
