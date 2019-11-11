class Listing < ApplicationRecord
  has_and_belongs_to_many :explorer
  has_many :employer
  has_many :environment
  has_many :trait
end
