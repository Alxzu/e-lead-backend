# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_03_185811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimensions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "width"
    t.decimal "height"
    t.decimal "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_dimensions_on_product_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.decimal "price"
    t.decimal "discount_percentage"
    t.decimal "rating"
    t.integer "stock"
    t.string "brand"
    t.string "sku"
    t.decimal "weight"
    t.string "warranty_information"
    t.string "shipping_information"
    t.string "availability_status"
    t.string "return_policy"
    t.integer "minimum_order_quantity"
    t.string "barcode"
    t.string "qr_code"
    t.datetime "meta_created_at"
    t.datetime "meta_updated_at"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "products_tags", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "date"
    t.string "reviewer_name"
    t.string "reviewer_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.jsonb "data", default: {}
    t.index ["store_id"], name: "index_settings_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "host_name", default: "", null: false
    t.string "vanity_host_name", default: "", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dimensions", "products"
  add_foreign_key "images", "products"
  add_foreign_key "reviews", "products"
  add_foreign_key "settings", "stores"
end
