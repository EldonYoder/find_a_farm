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

ActiveRecord::Schema.define(version: 20140812234725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "hours_open"
    t.string   "days_open"
    t.string   "months_open"
    t.string   "phone_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "email_address"
    t.string   "payment_types"
    t.string   "offer_spring"
    t.string   "offer_summer"
    t.string   "offer_fall"
    t.string   "offer_winter"
  end

  create_table "links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "status",     default: "draft"
    t.text     "content"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "ratings", force: true do |t|
    t.integer  "rate_value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_visited"
    t.integer  "rateable_id"
    t.string   "rateable_type"
  end

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
