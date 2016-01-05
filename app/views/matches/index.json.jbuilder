json.array!(@matches) do |match|
  json.extract! match, :id, :tournament_id, :map, :team1_id, :team2_id, :score_team1, :score_team2, :stream
  json.url match_url(match, format: :json)
end