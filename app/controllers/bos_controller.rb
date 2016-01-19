class BosController < ApplicationController
  before_action :set_bo, only: [:show, :edit, :update, :destroy]

  # GET /bos
  # GET /bos.json
  def index
    @bos = Bo.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @bos, status: :ok }
    end
  end

  # GET /bos/1
  # GET /bos/1.json
  def show
    @bo = Bo.find(params[:id])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @bo, status: :ok }
    end
  end

  # GET /bos/new
  def new
    @bo = Bo.new
  end

  # GET /bos/1/edit
  def edit
  end

  # POST /bos
  # POST /bos.json
  def create
    @bo = Bo.new(bo_params)

    respond_to do |format|
      if @bo.save
        format.html { redirect_to @bo, notice: 'Bo was successfully created.' }
        format.json { render :show, status: :created, location: @bo }
      else
        format.html { render :new }
        format.json { render json: @bo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bos/1
  # PATCH/PUT /bos/1.json
  def update
    respond_to do |format|
      if @bo.update(bo_params)
        format.html { redirect_to @bo, notice: 'Bo was successfully updated.' }
        format.json { render :show, status: :ok, location: @bo }
      else
        format.html { render :edit }
        format.json { render json: @bo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bos/1
  # DELETE /bos/1.json
  def destroy
    @bo.destroy
    respond_to do |format|
      format.html { redirect_to bos_url, notice: 'Bo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bo
      @bo = Bo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bo_params
      params.require(:bo).permit(:name, :phase)
    end
end
