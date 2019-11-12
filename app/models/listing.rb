class Listing < ApplicationRecord
  has_and_belongs_to_many :explorers_profiles
  has_many :employer_profile
  has_many :environment
  has_many :trait
end