class ExplorersProfile < ApplicationRecord
  has_and_belongs_to_many :listings
  belongs_to :explorer
  has_many :explorers_profiles_listing
  has_many :listing, through: :explorers_profiles_listing
end
