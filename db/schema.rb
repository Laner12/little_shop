# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160802205506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "celebrities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                     precision: 9, scale: 2
    t.integer  "category_id"
    t.integer  "celebrity_id"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "image_path"
    t.integer  "status",                                            default: 0
    t.string   "upload_image_file_name"
    t.string   "upload_image_content_type"
    t.integer  "upload_image_file_size"
    t.datetime "upload_image_updated_at"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["celebrity_id"], name: "index_items_on_celebrity_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.text     "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state",              default: "ZZ"
    t.integer  "zip_code",           default: 99999
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "role",               default: 0
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "celebrities"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
end
