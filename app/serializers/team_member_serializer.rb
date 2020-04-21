class TeamMemberSerializer < ActiveModel::Serializer
  attributes :id, :team_id, :member_id

  belongs_to :member
  belongs_to :team
end
