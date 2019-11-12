class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    input = current_explorer.id
    explorers_profile_path(id: input)
  end
end
