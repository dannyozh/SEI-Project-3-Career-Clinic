class ListingsController < ApplicationController
  # before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    p "this is params"
    p params
    p "this is params"

    if params[:listing]
      if x = params[:listing][:trait_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i }
        #convert element from string to integer
        x.shift()
        p "this is xxxxxxxxxxxx", x
        #pop out empty first element
        @listings_ids = ListingsTrait.where("trait_id IN (?)", x).map { |x| x.listing_id }
        #look inside inner table. find trait id
        #SELECT* FROM LISTINGSTRAIT WHERE (trait_id IN $1)
        #x takes the place of the question mark
        #x is mapped so you can locate listing id
        @listings = Listing.where("id IN (?)", @listings_ids)
        p @listings
        p "################"
      elsif x = params[:listing][:environment_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i }
        x.shift()
        @listings_ids = EnvironmentsListing.where("environment_id IN (?)", x).map { |x| x.listing_id }
        @listings = Listing.where("id IN (?)", @listings_ids)
        p @listings
      elsif x = params[:listing][:industry_ids]
        # finding the array for trait
        x = x.map { |s| s.to_i }
        x.shift()
        @listings_ids = IndustriesListing.where("industry_id IN (?)", x).map { |x| x.listing_id }
        @listings = Listing.where("id IN (?)", @listings_ids)
        p @listings
      end
    else
      # @traits = Trait.all
      # @listings = Listing.all
      @listings = Listing.search(params[:search])
    end
    p "@@@@@@@@@@"
    @traits = Trait.all
    @environments = Environment.all
    @industries = Industry.all
    @form = params[:q]
    @search = Search.new
    @durations = Listing.all.map { |list| list.duration }.uniq
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end

    @all_explorers_profiles_listings = ExplorersProfilesListing.all

    # Sort by latest and earliest
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @listings = Listing.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @listings = Listing.all().order("created_at DESC")
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    # @search = Search.find(params[:id])

    if current_employer
      @matchListing = Listing.find(@listing.id).employer_profile_id
      # @matchEmployer = @matchListing.employer_profile_id
      p "2222222222", @matchListing
      p "33333333", current_employer.id
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
      @checkListing = Listing.where(:employer_profile_id => current_employer.id)
      # p "CHECKLISTING ISISIS", @checkListing
      if @checkListing.exists?
        #retrieves listing id
        # @employersListing = ExplorersProfilesListing.where(:listing_id => params[:id]).map { |x| x.listing_id }
        # p "00000000000000", @employersListing

        #finds the explorer's id
        # @explorer_profile_ids = Listing.find_by(:employer_profile_id => current_employer.id).explorers_profiles_listing.map { |x| x.explorers_profile_id }
        @explorer_profile_ids = ExplorersProfilesListing.where(:listing_id => params[:id]).map { |x| x.explorers_profile_id }
        p "@*@*@*@**@*@*@@**@*@*@*@*", @explorer_profile_ids

        #finds the explorer profile by his id
        @profiles = ExplorersProfile.where("id IN (?)", @explorer_profile_ids)
        p "HIHHIHIHIHH", @profiles
      end
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
      # p "@@@@@@@@@@", @listing.id
      @queryStatus = ExplorersProfilesListing.where(:explorers_profile_id => current_explorer.id, :listing_id => @listing.id, :connect => "true")
    end
  end

  def link
    @listing = Listing.find(params[:listid])
    @explorers_profile = ExplorersProfile.find(params[:exid])
    # # @profiles = ExplorersProfile.where("id IN (?)", @explorer_profile_ids)
    @findListing = ExplorersProfilesListing.where(:explorers_profile_id => @explorers_profile.id, :listing_id => @listing.id, :connect => "true")
    if @findListing.exists?
      redirect_to @listing, danger: "You're already in touch!"
    else
      ExplorersProfilesListing.where(:explorers_profile_id => @explorers_profile.id, :listing_id => @listing.id).update(connect: "true")
      redirect_to @listing, success: "You're connected!"
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @traits = Trait.all
    @industries = Industry.all
    @environments = Environment.all
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    else
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  # GET /listings/1/edit
  def edit
    @traits = Trait.all
    @industries = Industry.all
    @environments = Environment.all
    @listing = Listing.find(params[:id])
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    puts params
    @listing = Listing.new(listing_params)

    # format duration string before placing into column
    d1 = params[:listing][:duration] # number eg.5
    d2 = params[:listing][:select_attribute] #day month year
    e = d1 + " " + d2
    @listing.duration = e

    # placing employer id
    @listing.employer_profile_id = current_employer.id

    @listing.save
    id = current_employer.id
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    redirect_to @employers_profile
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    @traits = Trait.all
    @industries = Industry.all
    @environments = Environment.all

    # format duration string before placing into column
    d1 = params[:listing][:duration] # number eg.5
    d2 = params[:listing][:select_attribute] #day month year
    e = d1 + " " + d2

    @listing.duration = e

    @listing.update(listing_params)
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)

    redirect_to @employers_profile
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    redirect_to @employers_profile
  end

  def interest
    @listing = Listing.find(params[:listid])
    # p "%%%%%%%%%%%%", @listing.id
    @explorers_profile = ExplorersProfile.find(params[:exid])
    # p "@@@@@@@@@@@", @explorers_profile.id
    @interestListing = ExplorersProfilesListing.new(:explorers_profile_id => @explorers_profile.id, :listing_id => @listing.id)
    # p "$$$$$$$$$", @interestListing
    @findListing = ExplorersProfilesListing.where(:explorers_profile_id => @explorers_profile.id, :listing_id => @listing.id)
    # p "&&&&&&&&&&&&*&*&*", @findListing
    if @findListing.exists?
      redirect_to @listing, danger: "You've already registered interest"
    else
      @interestListing.save
      redirect_to @listing, success: "Interest registered!"
    end
  end

  # def connect
  #   @explorer_profile_ids = Listing.find_by(:employer_profile_id => current_employer.id).explorers_profiles_listing.map { |x| x.explorers_profile_id }
  #   #go to listing table and find listing which belongs to this employer and find the explorer that has interest in this listing in the inner join table
  #   @profiles = ExplorersProfile.where("id IN (?)", @explorer_profile_ids)
  #   #find the explorer's profile
  #   if current_employer
  #     @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
  #   elsif current_explorer
  #     @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
  #   end
  # end

  private

  def listing_params
    params.require(:listing).permit(:job_title, :contact, :industry, :location, :photo_url, :description, :personality, :choice, :trait_ids => [], :environment_ids => [], :industry_ids => [])
  end
end
