class EnvironmentsListing < ApplicationRecord
    belongs_to :environment
    belongs_to :listing
  end