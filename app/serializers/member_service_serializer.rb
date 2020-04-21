class MemberServiceSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :contact_name, :description, :image, :website_url, :facebook_url, :twitter_url, :instagram_url, :email, :phone, :active
  # model association
end
