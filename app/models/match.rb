class Match < ActiveRecord::Base
    belongs_to :tournament
    belongs_to :team1, class_name:'Team', foreign_key: 'team1_id'
    belongs_to :team2, class_name:'Team', foreign_key: 'team2_id'

  def name_result
    "#{team1}(#{score_team1}) vs #{team2}(#{score_team1})"
  end

  def to_s
  	name_result
  end
end
