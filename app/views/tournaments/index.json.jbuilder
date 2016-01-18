json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :description, :game, :teams_limit, :signup_start, :signup_end, :check_in, :date, :mode
  json.url tournament_url(tournament, format: :json)
end
