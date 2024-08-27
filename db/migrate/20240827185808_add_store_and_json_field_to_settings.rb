class AddStoreAndJsonFieldToSettings < ActiveRecord::Migration[7.2]
  def change
    add_reference :settings, :store, null: false, foreign_key: true
    add_column :settings, :data, :jsonb, default: {}
    remove_column :settings, :key, :string
    remove_column :settings, :value, :text
    remove_column :settings, :value_type, :string
  end
end
