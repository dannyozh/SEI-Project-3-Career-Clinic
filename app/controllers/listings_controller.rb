class ListingsController < ApplicationController
  # before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
    @listings = Listing.search(params[:search])
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @traits = Trait.all
    @industries = Industry.all
    @environments = Environment.all
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    puts params
    @listing = Listing.new(listing_params)
    @listing.employer_profile_id = current_employer.id
    @listing.save
    id = current_employer.id
    @employers_profile = EmployersProfile.find(id)

    redirect_to @employers_profile
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    redirect_to @listing
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to @listing
  end
end

private

def listing_params
  params.require(:listing).permit(:job_title, :contact, :industry, :duration, :location, :photo_url, :description, :personality, :choice, :trait_ids => [], :environment_ids => [], :industry_ids => [])
end