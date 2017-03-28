class Employee < ApplicationRecord
  # has_one :user
  has_many :job_applications
  has_many :jobs
end
