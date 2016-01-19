class Bo < ActiveRecord::Base
  has_many :bo_tournaments
  has_many :tournaments, through: :bo_tournaments

  def name_with_phase
    "#{name} - #{phase}"
  end

  def to_s
    name_with_phase
  end
end
