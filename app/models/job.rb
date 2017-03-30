class Job < ApplicationRecord
  belongs_to :employer
  has_many :job_applications, dependent: :destroy
  belongs_to :employee, optional: true
end
