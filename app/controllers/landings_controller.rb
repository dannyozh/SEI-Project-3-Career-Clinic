class LandingsController < ApplicationController
  def landing
  end

  def welcome
    id = current_explorer.id
    @explorers_profile = ExplorersProfile.find(id)
  end
end
