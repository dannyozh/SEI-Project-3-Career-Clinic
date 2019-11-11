class ExplorersController < ApplicationController
  before_action :set_explorer, only: [:show, :edit, :update, :destroy]

  def index
    @explorers = Explorer.all
  end

  def show
    @explorer = Explorer.find(params[:id])
  end

  def new
    @explorer = Explorer.new
  end

  def edit
  end

  def create
    @explorer = Explorer.new(explorer_params)

    respond_to do |format|
      if @explorer.save
        format.html { redirect_to @explorer, notice: "Explorer was successfully created." }
        format.json { render :show, status: :created, location: @explorer }
      else
        format.html { render :new }
        format.json { render json: @explorer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @explorer.update(explorer_params)
        format.html { redirect_to @explorer, notice: "Explorer was successfully updated." }
        format.json { render :show, status: :ok, location: @explorer }
      else
        format.html { render :edit }
        format.json { render json: @explorer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @explorer.destroy
    respond_to do |format|
      format.html { redirect_to explorers_url, notice: "Explorer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_explorer
    @explorer = Explorer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def explorer_params
    params.fetch(:explorer, {})
  end
end
