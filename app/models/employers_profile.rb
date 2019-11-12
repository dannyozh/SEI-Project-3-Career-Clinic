class EmployersProfile < ApplicationRecord
  has_many :listing
  has_many :employer
end
