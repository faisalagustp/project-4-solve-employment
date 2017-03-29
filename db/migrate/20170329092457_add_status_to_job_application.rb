class AddStatusToJobApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :status, :string
  end
end
