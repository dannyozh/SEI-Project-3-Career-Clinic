class ExplorersProfile < ApplicationRecord
  has_many :explorer
  has_many :explorers_profiles_listing
  has_many :listing, through: :explorers_profiles_listing
end
