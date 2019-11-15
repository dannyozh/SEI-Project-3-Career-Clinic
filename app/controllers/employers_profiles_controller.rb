require 'yaml'
class EmployersProfilesController < ApplicationController
  # before_action :set_employers_profile, only: [:show, :edit, :update, :destroy]

  # GET /employers_profiles
  # GET /employers_profiles.json
  def index
    @employers_profiles = EmployersProfile.all
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)


  end

  # GET /employers_profiles/1
  # GET /employers_profiles/1.json
  def show
    @employers_profile = EmployersProfile.find(params[:id])
    employerid = @employers_profile.id
    # p "@@@@@@@@@", employerid
    @listing = Listing.where(employer_profile_id: employerid)
  end

  # GET /employers_profiles/new
  def new
    @employers_profile = EmployersProfile.new


  end

  # GET /employers_profiles/1/edit
  def edit
    @employers_profile = EmployersProfile.find(params[:id])

  end

  # POST /employers_profiles
  # POST /employers_profiles.json
  def create
    @employers_profile = EmployersProfile.new(employers_profile_params)
    @employers_profile.employer_id = current_employer.id
    if (params[:employers_profile][:company_logo_cloud])

      p "@@@@@@@"
      p Cloudinary.config.api_key
      p "@@@@@@@"

    uploaded_file = params[:employers_profile][:company_logo_cloud].path
    auth = Rails.application.credentials.cloudinary

    if defined? CLOUDINARY_URL
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file, CLOUDINARY_URL)
    else
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file, auth)
    end
    # Use this when uploading to heroku and paste in the environment variable in settings:
    # cloudnary_file = Cloudinary::Uploader.upload(uploaded_file, CLOUDINARY_URL)

     #store this public_id value to the database
     #cloudnary_file[‘public_id’]
     # render json: cloudnary_file
     # p cloudnary_file
     # s1 = cloudnary_file['public_id']
     s2 = cloudnary_file['url']
       # @employers_profile.cloud_key = s1
       @employers_profile.company_logo = s2
else
  @employers_profile.company_logo = params[:employers_profile][:company_logo]
end

    respond_to do |format|
      if @employers_profile.save
        format.html { redirect_to "/listings/new", notice: "Employers profile was successfully created." }
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

     @employers_profile = EmployersProfile.find(params[:id])
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
    params.require(:employers_profile).permit(:company_name, :industry)
  end
end