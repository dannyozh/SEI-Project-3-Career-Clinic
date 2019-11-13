class Trait < ApplicationRecord
  has_and_belongs_to_many :listings
  has_many :listings_trait
end
