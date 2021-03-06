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

ActiveRecord::Schema.define(version: 20160120081925) do

  create_table "bo_tournaments", force: :cascade do |t|
    t.integer  "bo_id",         limit: 4
    t.integer  "tournament_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "bos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phase",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "tournament_id",            limit: 4
    t.string   "map",                      limit: 255
    t.integer  "team1_id",                 limit: 4
    t.integer  "team2_id",                 limit: 4
    t.integer  "score_team1",              limit: 4
    t.integer  "score_team2",              limit: 4
    t.string   "stream",                   limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "screen_shot_file_name",    limit: 255
    t.string   "screen_shot_content_type", limit: 255
    t.integer  "screen_shot_file_size",    limit: 4
    t.datetime "screen_shot_updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teams_tournaments", id: false, force: :cascade do |t|
    t.integer "team_id",       limit: 4, null: false
    t.integer "tournament_id", limit: 4, null: false
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id", limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "game_id",      limit: 4
    t.integer  "teams_limit",  limit: 4
    t.datetime "signup_start"
    t.datetime "signup_end"
    t.datetime "check_in"
    t.datetime "date"
    t.integer  "mode",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
