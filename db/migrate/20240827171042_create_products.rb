class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :category
      t.decimal :price
      t.decimal :discount_percentage
      t.decimal :rating
      t.integer :stock
      t.string :brand
      t.string :sku
      t.decimal :weight
      t.string :warranty_information
      t.string :shipping_information
      t.string :availability_status
      t.string :return_policy
      t.integer :minimum_order_quantity
      t.string :barcode
      t.string :qr_code
      t.datetime :meta_created_at
      t.datetime :meta_updated_at
      t.string :thumbnail

      t.timestamps
    end
  end
end
