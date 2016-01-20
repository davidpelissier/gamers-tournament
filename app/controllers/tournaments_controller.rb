class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @tournaments, status: :ok }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournaments = Tournament.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tournaments, status: :ok }
    end
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /tournaments/:id_tounament/:id_team/enroll
  # Join the tournament
  def enroll
    @tournament = Tournament.find(params[:id_tournament])
    @team       = Team.find(params[:id_team])
    # check if the user can enroll
    if current_user.teams.include?(@team) && !@tournament.teams.include?(@team)
      @tournament.teams << @team
      redirect_to @tournament, notice: 'Vous avez bien rejoint le tournoi'+ @tournament.name
    else
      redirect_to @tournament, notice: 'Vous n\'avez pas le droit de rejoindre le tournoi'+ @tournament.name
    end
  end

  # DELETE /tournaments/:id_tounament/:id_team/leave
  # Leave a tournament
  def leave
    @tournament = Tournament.find(params[:id_tournament])
    @team       = Team.find(params[:id_team])
    # check if the user can enroll
    if current_user.teams.include?(@team) && @tournament.teams.include?(@team) 
      @tournament.teams.delete(@team)
      redirect_to @tournament, notice: 'Vous avez bien quitté le tournoi'+ @tournament.name
    else
      redirect_to @tournament, notice: 'Vous n\'avez pas le droit de quitter le tournoi'+ @tournament.name
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :description, :game_id, :teams_limit, :signup_start, :signup_end, :check_in, :date, :mode)
    end
end
