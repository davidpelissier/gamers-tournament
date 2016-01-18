class TournamentSerializer < ActiveModel::Serializer
	has_many :bos, through: :bo_tournaments, embed: :ids

  attributes :id, :name, :description, :game_id, :teams_limit, :signup_start, :signup_end, :check_in,
  					 :date, :mode, :created_at, :updated_at
end
