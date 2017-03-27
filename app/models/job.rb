class Job < ApplicationRecord
  belongs_to :employer
  has_many :applications
end
