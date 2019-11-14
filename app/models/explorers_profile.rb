class ExplorersProfile < ApplicationRecord
  has_and_belongs_to_many :listings
  has_many :explorer
  has_many :explorers_profiles_listing
end
