class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.text :coverletter
      t.references :job, foreign_key: true
      t.references :employee, foreign_key: true
      t.integer :rating_employee
      t.integer :rating_employer
      t.text :review_employer
      t.text :review_employee

      t.timestamps
    end
  end
end
