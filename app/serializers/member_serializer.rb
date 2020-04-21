class MemberSerializer < ActiveModel::Serializer
  attributes :shirt_size_id, :short_size_id, :status_id, :id, :first_name, :last_name,
    :birthday, :phone, :email, :postal_code, :image, :member_since, :deceased,
    :deceased_date, :masters_eligible, :active

  belongs_to :shirt_size
  belongs_to :short_size
  belongs_to :status

  has_one :contact
  has_many :notes
  has_many :positions
  
end
