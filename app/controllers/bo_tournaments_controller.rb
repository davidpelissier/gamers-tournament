class BoTournamentsController < ApplicationController
  before_action :set_bo_tournament, only: [:show, :edit, :update, :destroy]

  # GET /bo_tournaments
  # GET /bo_tournaments.json
  def index
    @bo_tournaments = BoTournament.all
  end

  # GET /bo_tournaments/1
  # GET /bo_tournaments/1.json
  def show
  end

  # GET /bo_tournaments/new
  def new
    @bo_tournament = BoTournament.new
  end

  # GET /bo_tournaments/1/edit
  def edit
  end

  # POST /bo_tournaments
  # POST /bo_tournaments.json
  def create
    @bo_tournament = BoTournament.new(bo_tournament_params)

    respond_to do |format|
      if @bo_tournament.save
        format.html { redirect_to @bo_tournament, notice: 'Bo tournament was successfully created.' }
        format.json { render :show, status: :created, location: @bo_tournament }
      else
        format.html { render :new }
        format.json { render json: @bo_tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bo_tournaments/1
  # PATCH/PUT /bo_tournaments/1.json
  def update
    respond_to do |format|
      if @bo_tournament.update(bo_tournament_params)
        format.html { redirect_to @bo_tournament, notice: 'Bo tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @bo_tournament }
      else
        format.html { render :edit }
        format.json { render json: @bo_tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bo_tournaments/1
  # DELETE /bo_tournaments/1.json
  def destroy
    @bo_tournament.destroy
    respond_to do |format|
      format.html { redirect_to bo_tournaments_url, notice: 'Bo tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bo_tournament
      @bo_tournament = BoTournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bo_tournament_params
      params.require(:bo_tournament).permit(:bo_id, :tournament_id)
    end
end
