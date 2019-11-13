class Environment < ApplicationRecord
  has_and_belongs_to_many :listings
  has_many :environments_listing
end
