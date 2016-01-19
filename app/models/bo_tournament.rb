class BoTournament < ActiveRecord::Base
  belongs_to :bo
  belongs_to :tournament
end
