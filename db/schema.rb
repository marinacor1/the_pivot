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

ActiveRecord::Schema.define(version: 20160816174044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "state"
  end

  create_table "days", force: :cascade do |t|
    t.date    "date"
    t.integer "reservation_id"
  end

  add_index "days", ["reservation_id"], name: "index_days_on_reservation_id", using: :btree

  create_table "homes", force: :cascade do |t|
    t.string  "image_url"
    t.string  "address"
    t.string  "zip_code"
    t.string  "title"
    t.string  "description"
    t.decimal "daily_rate"
    t.integer "city_id"
    t.boolean "online",      default: true,  null: false
    t.boolean "pending",     default: false
  end

  add_index "homes", ["city_id"], name: "index_homes_on_city_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer "home_id"
    t.integer "trip_id"
    t.integer "user_id"
    t.date    "check_in"
    t.date    "check_out"
    t.boolean "pending",   default: true
  end

  add_index "reservations", ["home_id"], name: "index_reservations_on_home_id", using: :btree
  add_index "reservations", ["trip_id"], name: "index_reservations_on_trip_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "home_id"
    t.integer  "trip_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "thoughts"
    t.text     "title"
    t.text     "user_id"
    t.integer  "reservation_id"
  end

  add_index "reviews", ["home_id"], name: "index_reviews_on_home_id", using: :btree
  add_index "reviews", ["reservation_id"], name: "index_reviews_on_reservation_id", using: :btree
  add_index "reviews", ["trip_id"], name: "index_reviews_on_trip_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "review_id"
  end

  add_index "trips", ["review_id"], name: "index_trips_on_review_id", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "home_id"
  end

  add_index "users", ["home_id"], name: "index_users_on_home_id", using: :btree

  add_foreign_key "days", "reservations"
  add_foreign_key "homes", "cities"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "homes"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "reviews", "trips"
  add_foreign_key "trips", "reviews"
  add_foreign_key "trips", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "homes"
end
