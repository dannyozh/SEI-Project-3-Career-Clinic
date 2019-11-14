class LandingsController < ApplicationController
  def landing
    if current_employer
      @employers_profile = EmployersProfile.find_by(:employer_id => current_employer.id)
    elsif current_explorer
      @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
    end
  end

  def welcome
    @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
  end
end
