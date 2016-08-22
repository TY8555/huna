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

ActiveRecord::Schema.define(version: 20160703042235) do

  create_table "boards", force: :cascade do |t|
    t.string   "board_title"
    t.integer  "age"
    t.integer  "number"
    t.string   "board_content"
    t.string   "needs_team"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.string   "reply_title"
    t.string   "reply"
    t.boolean  "apply",       default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "replies", ["board_id"], name: "index_replies_on_board_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_email"
    t.string   "password"
    t.string   "nickname"
    t.integer  "age"
    t.string   "school"
    t.string   "major"
    t.string   "images",         default: ""
    t.string   "kakao"
    t.boolean  "sex"
    t.string   "student_number"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
