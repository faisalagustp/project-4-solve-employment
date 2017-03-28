class AddUserToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :user_id, :integer
  end
end
