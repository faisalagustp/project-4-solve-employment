class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :employee

  serialize :rating_employee
  serialize :review_employee
  serialize :rating_employer
  serialize :review_employer
end
