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

ActiveRecord::Schema.define(version: 20170217190643) do

  create_table "grades", force: :cascade do |t|
    t.integer  "grade"
    t.date     "date"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "credit"
  end

  add_index "grades", ["subject_id"], name: "index_grades_on_subject_id"
  add_index "grades", ["user_id"], name: "index_grades_on_user_id"

  create_table "homeworks", force: :cascade do |t|
    t.text     "description"
    t.date     "deadline"
    t.boolean  "completed",   default: false
    t.integer  "priority"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "homeworks", ["subject_id"], name: "index_homeworks_on_subject_id"
  add_index "homeworks", ["user_id"], name: "index_homeworks_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects", ["user_id"], name: "index_subjects_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
