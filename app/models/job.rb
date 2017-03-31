class Job < ApplicationRecord
  belongs_to :employer
  has_many :job_applications, dependent: :destroy
  has_many :employees, through: :job_applications
end
