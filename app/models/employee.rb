class Employee < ApplicationRecord
  has_one :user
  has_many :job_applications
end
