class ExplorersProfilesController < ApplicationController
  before_action :set_explorers_profile, only: [:show, :edit, :update, :destroy]

  # GET /explorers_profiles
  # GET /explorers_profiles.json
  def index
    @explorers_profiles = ExplorersProfile.all
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  # GET /explorers_profiles/1
  # GET /explorers_profiles/1.json
  def show
    @locateinnerjoin = ExplorersProfilesListing.where(:explorers_profile_id => params[:id]).map { |x| x.listing_id }
    @requiredlisting = Listing.where(:id => @locateinnerjoin)
    @all_explorers_profiles_listings = ExplorersProfilesListing.all
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
      # p "@@@@@@@", @explorer.name
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  # GET /explorers_profiles/new
  def new
    @explorers_profile = ExplorersProfile.new
  end

  # GET /explorers_profiles/1/edit
  def edit
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  # POST /explorers_profiles
  # POST /explorers_profiles.json
  def create
    @explorers_profile = ExplorersProfile.new(explorers_profile_params)
    @explorers_profile.explorer_id = current_explorer.id

    if (params[:explorers_profile][:photo_url_cloud])
      p "@@@@@@@"
      p Cloudinary.config.api_key
      p "@@@@@@@"

      uploaded_file = params[:explorers_profile][:photo_url_cloud].path
      auth = Rails.application.credentials.cloudinary

      if defined? CLOUDINARY_URL
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file, CLOUDINARY_URL)
      else
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file, auth)
      end
      #store this public_id value to the database
      #cloudnary_file[‘public_id’]
      # render json: cloudnary_file
      # p cloudnary_file
      # s1 = cloudnary_file['public_id']
      s2 = cloudnary_file["url"]
      # @employers_profile.cloud_key = s1
      @explorers_profile.photo_url = s2
    else
      @explorers_profile.photo_url = params[:explorers_profile][:photo_url]
    end
    respond_to do |format|
      if @explorers_profile.save
        format.html { redirect_to "/welcome", notice: "Explorers profile was successfully created." }
        format.json { render :show, status: :created, location: @explorers_profile }
      else
        format.html { render :new }
        format.json { render json: @explorers_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explorers_profiles/1
  # PATCH/PUT /explorers_profiles/1.json
  def update
    respond_to do |format|
      if @explorers_profile.update(explorers_profile_params)
        format.html { redirect_to @explorers_profile, notice: "Explorers profile was successfully updated." }
        format.json { render :show, status: :ok, location: @explorers_profile }
      else
        format.html { render :edit }
        format.json { render json: @explorers_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explorers_profiles/1
  # DELETE /explorers_profiles/1.json
  def destroy
    @explorers_profile.destroy
    respond_to do |format|
      format.html { redirect_to explorers_profiles_url, notice: "Explorers profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_explorers_profile
    @explorers_profile = ExplorersProfile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def explorers_profile_params
    params.require(:explorers_profile).permit(:name, :age)
  end
end
