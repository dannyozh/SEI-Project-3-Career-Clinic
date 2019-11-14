class SearchesController < ApplicationController

  def new
    @search = Search.new
    @durations = Listing.all.map{|list| list.duration}.uniq
    @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)

end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:keywords, :duration)
  end

end