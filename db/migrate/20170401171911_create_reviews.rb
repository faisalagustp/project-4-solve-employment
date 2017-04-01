class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.integer :employer_id
      t.integer :employee_id
      t.string :review_for

      t.timestamps
    end
  end
end
