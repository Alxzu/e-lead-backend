class AddHostNameToStore < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :host_name, :string, null: false, default: ''
    add_column :stores, :vanity_host_name, :string, null: false, default: ''
  end
end
