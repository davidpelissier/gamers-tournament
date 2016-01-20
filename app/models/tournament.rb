class Tournament < ActiveRecord::Base
  belongs_to :game
  has_many :bo_tournaments
  has_many :bos, through: :bo_tournaments
  has_and_belongs_to_many :teams

  def name_with_game
    "#{name}"
  end

  def to_s
    name_with_game
  end
end
