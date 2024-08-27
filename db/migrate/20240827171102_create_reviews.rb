class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :rating
      t.text :comment
      t.datetime :date
      t.string :reviewer_name
      t.string :reviewer_email

      t.timestamps
    end
  end
end
