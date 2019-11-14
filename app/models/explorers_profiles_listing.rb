class ExplorersProfilesListing < ApplicationRecord
  has_many :listing
  has_many :explorer
end
