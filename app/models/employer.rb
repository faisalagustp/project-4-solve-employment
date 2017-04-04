class Employer < ApplicationRecord
  has_one :user
  has_many :jobs



end
