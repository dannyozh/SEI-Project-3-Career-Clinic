class EmployersProfile < ApplicationRecord
  has_many :listing
  belongs_to :employer


end