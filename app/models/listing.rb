class Listing < ApplicationRecord
  has_and_belongs_to_many :explorer_profile
  has_many :employer_profile
  has_many :environment
  has_many :trait
end
