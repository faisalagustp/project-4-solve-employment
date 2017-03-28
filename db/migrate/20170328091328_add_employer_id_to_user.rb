class AddEmployerIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :employer_id, :integer
    add_column :users, :employee_id, :integer
  end
end
