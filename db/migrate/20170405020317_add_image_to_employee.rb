class AddImageToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :image, :string
  end
end
