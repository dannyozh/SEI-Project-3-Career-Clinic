class ListingsController < ApplicationController
  # before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index

    p "this is params"
    p params
    p "this is params"
    if params[:listing]
      if
        x = params[:listing][:trait_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i}
        #convert element from string to integer
        x.shift()
        #pop out empty first element
        @listings_ids = ListingsTrait.where("trait_id IN (?)",x).map{|x|x.listing_id}
        #look inside inner table. find trait id
        #SELECT* FROM LISTINGSTRAIT WHERE (trait_id IN $1)
        #x takes the place of the question mark
        #x is mapped so you can locate listing id
        @listings = Listing.where("id IN (?)",@listings_ids)
        p @listings
        p "################"
      elsif
        x = params[:listing][:environment_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i}
        x.shift()
        @listings_ids = EnvironmentsListing.where("environment_id IN (?)",x).map{|x|x.listing_id}
        @listings = Listing.where("id IN (?)",@listings_ids)
        p @listings
      elsif
        x = params[:listing][:industry_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i}
        x.shift()
        @listings_ids = IndustriesListing.where("industry_id IN (?)",x).map{|x|x.listing_id}
        @listings = Listing.where("id IN (?)",@listings_ids)
        p @listings
      end
    else
      # @traits = Trait.all
      @listings = Listing.all
      @listings = Listing.search(params[:search])
    end
    p "@@@@@@@@@@"
      @traits = Trait.all
      @environments = Environment.all
      @industries = Industry.all
      @form = params[:q]
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)

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
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
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
    p "$$$$$$$$$$$$", @listing
    @listing.save
    id = current_employer.id
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
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