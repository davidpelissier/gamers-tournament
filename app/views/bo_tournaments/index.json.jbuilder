json.array!(@bo_tournaments) do |bo_tournament|
  json.extract! bo_tournament, :id, :bo_id, :tournament_id
  json.url bo_tournament_url(bo_tournament, format: :json)
end
