class EmployersProfilesController < ApplicationController
  before_action :set_employers_profile, only: [:show, :edit, :update, :destroy]

  # GET /employers_profiles
  # GET /employers_profiles.json
  def index
    @employers_profiles = EmployersProfile.all
  end

  # GET /employers_profiles/1
  # GET /employers_profiles/1.json
  def show
  end

  # GET /employers_profiles/new
  def new
    @employers_profile = EmployersProfile.new
  end

  # GET /employers_profiles/1/edit
  def edit
  end

  # POST /employers_profiles
  # POST /employers_profiles.json
  def create
    @employers_profile = EmployersProfile.new(employers_profile_params)
    @employers_profile.employer_id = current_employer.id

    respond_to do |format|
      if @employers_profile.save
        format.html { redirect_to @employers_profile, notice: "Employers profile was successfully created." }
        format.json { render :show, status: :created, location: @employers_profile }
      else
        format.html { render :new }
        format.json { render json: @employers_profile.errors, status: :unprocessable_entity }
        p "@@@@@@@", @employers_profile.errors.full_messages
      end
    end
  end

  # PATCH/PUT /employers_profiles/1
  # PATCH/PUT /employers_profiles/1.json
  def update
    respond_to do |format|
      if @employers_profile.update(employers_profile_params)
        format.html { redirect_to @employers_profile, notice: "Employers profile was successfully updated." }
        format.json { render :show, status: :ok, location: @employers_profile }
      else
        format.html { render :edit }
        format.json { render json: @employers_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers_profiles/1
  # DELETE /employers_profiles/1.json
  def destroy
    @employers_profile.destroy
    respond_to do |format|
      format.html { redirect_to employers_profiles_url, notice: "Employers profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employers_profile
    @employers_profile = EmployersProfile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employers_profile_params
    params.require(:employers_profile).permit(:company_name, :industry, :company_logo)
  end
end
