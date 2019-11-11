class ExplorersProfile < ApplicationRecord
  has_and_belongs_to_many :listing
  has_many :explorer
end
