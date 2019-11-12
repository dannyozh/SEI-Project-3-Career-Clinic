class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_explorer
      input = current_explorer.id
      explorers_profile_path(id: input)
    elsif current_employer
      input = current_employer.id
      employers_profile_path(id: input)
    end
  end
end
