class Employee < ApplicationRecord
  mount_uploader :image, ProfilePicUploader

  has_one :user
  has_many :job_applications
  has_many :jobs, through: :job_applications
end
