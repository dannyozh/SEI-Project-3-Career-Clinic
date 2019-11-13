class Industry < ApplicationRecord
  has_and_belongs_to_many :listings
  has_many :industries_listing
end
