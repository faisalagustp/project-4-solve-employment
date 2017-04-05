class Job < ApplicationRecord
  belongs_to :employer
  has_many :job_applications, dependent: :destroy
  has_many :employees, through: :job_applications

  validates :title, presence: true
  validates :description, presence: true
  validates :wage, numericality: { only_integer: true }
  validates :contact_person, presence: true
  validates :contact_email, presence: true
  validates :job_type, presence: true
  validates :time_commitment, numericality: true
  validates :location, presence: true
  validates :positions, presence: true, numericality: { only_integer: true }
end
