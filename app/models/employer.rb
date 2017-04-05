class Employer < ApplicationRecord
  mount_uploader :image, ProfilePicUploader

  has_one :user
  has_many :jobs

end
