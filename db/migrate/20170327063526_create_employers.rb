class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :company
      t.string :address

      t.timestamps
    end
  end
end
