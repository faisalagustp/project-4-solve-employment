class AddUserToEmployer < ActiveRecord::Migration[5.0]
  def change
    add_column :employers, :user_id, :integer
  end
end
