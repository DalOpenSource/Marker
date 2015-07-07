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

ActiveRecord::Schema.define(version: 20150629205621) do

  create_table "courses", force: :cascade do |t|
    t.string  "prefix",      limit: 255
    t.integer "code",        limit: 4
    t.string  "name",        limit: 255
    t.text    "description", limit: 65535
    t.integer "year",        limit: 4
    t.integer "semester",    limit: 4
    t.integer "section",     limit: 4
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "course_id",  limit: 4,                 null: false
    t.integer  "user_id",    limit: 4,                 null: false
    t.boolean  "can_attend", limit: 1, default: true
    t.boolean  "can_mark",   limit: 1, default: false
    t.boolean  "can_edit",   limit: 1, default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "permissions", ["course_id"], name: "index_permissions_on_course_id", using: :btree
  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "banner_id",   limit: 255, default: "B00000000", null: false
    t.string   "first_name",  limit: 255, default: "Student",   null: false
    t.string   "last_name",   limit: 255, default: "Name",      null: false
    t.string   "middle_name", limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "profiles", "users"
end
