class ExplorersProfile < ApplicationRecord
  has_and_belongs_to_many :listings
  has_many :explorer
end