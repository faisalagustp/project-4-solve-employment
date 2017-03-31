class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :wage
      t.references :employer, foreign_key: true
      t.string :contact_person
      t.string :contact_number
      t.string :contact_email
      t.text :device
      t.text :software
      t.text :skills
      t.string :job_type
      t.string :duration
      t.decimal :time_commitment
      t.text :training
      t.text :location
      t.integer :positions
      t.string :start_date


      t.timestamps
    end
  end
end
