class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.text :coverletter
      t.references :job, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
