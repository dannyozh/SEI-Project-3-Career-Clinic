class SearchesController < ApplicationController
  def new
    @search = Search.new
    @durations = Listing.all.map { |list| list.duration }.uniq
    # @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    else
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    else
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :duration)
  end
end
