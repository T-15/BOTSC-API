class SponsorSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :image, :website_url
  # model association
end
