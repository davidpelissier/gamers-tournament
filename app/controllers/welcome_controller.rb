class WelcomeController < ApplicationController
  def index
  	@tournaments = Tournament.all
  	@matchs     = Match.all
  end
end