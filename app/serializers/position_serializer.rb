class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :active
  has_many :members
end
