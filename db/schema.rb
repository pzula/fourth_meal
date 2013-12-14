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

ActiveRecord::Schema.define(version: 20131214000115) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories", force: true do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",             default: true
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "restaurant_id"
  end

  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id"

  create_table "order_details", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "delivery_street"
    t.string "delivery_address_2"
    t.string "delivery_city"
    t.string "delivery_state"
    t.string "delivery_zip"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",           default: "pending"
    t.integer  "order_details_id"
    t.string   "unique_url"
  end

  create_table "restaurant_details", force: true do |t|
    t.integer "restaurant_id"
    t.string  "phone"
    t.string  "street"
    t.string  "street2"
    t.string  "city"
    t.string  "state"
    t.integer "zip"
    t.text    "description"
    t.integer "hours_id"
    t.boolean "delivery"
    t.integer "delivery_range"
  end

  create_table "restaurant_employees", force: true do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
    t.boolean "stocker",       default: false
    t.boolean "admin",         default: false
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "url_slug"
    t.string   "status",     default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "food_type"
  end

  create_table "users", force: true do |t|
    t.string   "username",                         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitor_users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
