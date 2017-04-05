class AddImageToEmployer < ActiveRecord::Migration[5.0]
  def change
    add_column :employers, :image, :string
  end
end
