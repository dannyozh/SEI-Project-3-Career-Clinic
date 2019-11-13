class Listing < ApplicationRecord
  has_and_belongs_to_many :explorers_profiles
  has_many :employer_profile
  has_and_belongs_to_many :industries
  has_and_belongs_to_many :traits
  has_many :listings_trait
  has_many :environments_listing
  has_many :industries_listing
  has_and_belongs_to_many :environments
end
