class Match < ActiveRecord::Base
    belongs_to :tournament
    belongs_to :team1, class_name:'Team', foreign_key: 'team1_id'
    belongs_to :team2, class_name:'Team', foreign_key: 'team2_id'

    has_attached_file :screen_shot, styles: { medium: "300x300>", thumb: "100x100>" }
    # Validate attachment content type
  	validates_attachment_content_type :screen_shot, content_type: /\Aimage\/.*\Z/
  	# Validate filename
  	validates_attachment_file_name :screen_shot, matches: [/png\Z/, /jpe?g\Z/]

  def name_result
    "#{team1}(#{score_team1}) vs #{team2}(#{score_team1})"
  end

  def to_s
  	name_result
  end
end
