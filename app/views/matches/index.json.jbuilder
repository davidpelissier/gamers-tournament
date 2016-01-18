json.array!(@matches) do |match|
  json.extract! match, :id, :tournament, :map, :team1, :team2, :score_team1, :score_team2, :stream
  json.url match_url(match, format: :json)
end
