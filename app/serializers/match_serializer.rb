class MatchSerializer < ActiveModel::Serializer
  attributes :id, :tournament_id, :map, :team1_id, :team2_id, :score_team1, :score_team2, :stream, :created_at, :updated_at, :screen_shot_file_name
end
