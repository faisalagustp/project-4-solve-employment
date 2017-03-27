class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.decimal :wage
      t.references :employer, foreign_key: true
      t.integer :employee_id

      t.timestamps
    end
  end
end
