# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150323013052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorited_listings", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorited_listings", ["listing_id"], name: "index_favorited_listings_on_listing_id", using: :btree
  add_index "favorited_listings", ["user_id"], name: "index_favorited_listings_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.integer  "subcategory_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",          precision: 8, scale: 2
    t.string   "contact_name"
    t.string   "email"
    t.string   "telephone"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "listings", ["location_id"], name: "index_listings_on_location_id", using: :btree
  add_index "listings", ["subcategory_id"], name: "index_listings_on_subcategory_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reported_listings", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reported_listings", ["listing_id"], name: "index_reported_listings_on_listing_id", using: :btree
  add_index "reported_listings", ["user_id"], name: "index_reported_listings_on_user_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "api_token"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
