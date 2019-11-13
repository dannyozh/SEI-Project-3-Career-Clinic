class Search < ApplicationRecord

  def search_listings

    listings = Listing.all

    listings = listings.where(["LOWER(job_title) LIKE ?", "%#{keywords.downcase}%"]) if keywords.present?
    listings = listings.where(["duration LIKE ?", duration]) if duration.present?

    return listings

  end

end