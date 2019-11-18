class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  def after_sign_in_path_for(resource)
    if current_explorer
      input = current_explorer.id
      explorers_profile_path(id: input)
    elsif current_employer
      input = current_employer.id
      employers_profile_path(id: input)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
