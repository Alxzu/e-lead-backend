class CreateSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :settings do |t|
      t.string :key
      t.text :value
      t.string :value_type

      t.timestamps
    end
  end
end
