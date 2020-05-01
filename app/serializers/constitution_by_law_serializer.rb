class ConstitutionByLawSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :position, :title, :content, :active
end
