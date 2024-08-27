class CreateDimensions < ActiveRecord::Migration[7.2]
  def change
    create_table :dimensions do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :width
      t.decimal :height
      t.decimal :depth

      t.timestamps
    end
  end
end
