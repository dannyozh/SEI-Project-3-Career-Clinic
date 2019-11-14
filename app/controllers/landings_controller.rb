class LandingsController < ApplicationController
  def landing
    
  end

  def welcome
    @explorers_profile = ExplorersProfile.find_by(:explorer_id => current_explorer.id)
  end
end
