class AddStoreReferenceToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :store, null: false
  end
end
