class MatchSerializer < ActiveModel::Serializer
  attributes :id, :number, :date, :time, :home_score, :away_score, :additional_information
  has_one :home_team
  has_one :away_team
  has_one :field
  has_one :status
end
