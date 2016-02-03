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

ActiveRecord::Schema.define(version: 20160203154315) do

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bets", force: :cascade do |t|
    t.string   "team_one",         limit: 255
    t.string   "team_two",         limit: 255
    t.integer  "team_one_chance",  limit: 4,   default: 50
    t.integer  "team_two_chance",  limit: 4,   default: 50
    t.integer  "team_one_value",   limit: 4,   default: 2
    t.integer  "team_two_value",   limit: 4,   default: 2
    t.integer  "winner",           limit: 4
    t.integer  "bets_on_team_one", limit: 4,   default: 0
    t.integer  "bets_on_team_two", limit: 4,   default: 0
    t.integer  "can_bet",          limit: 4,   default: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "match_starts_at"
    t.string   "game",             limit: 255
    t.integer  "bestof",           limit: 4
    t.string   "stream_link",      limit: 255
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "street",            limit: 255
    t.string   "state",             limit: 255
    t.string   "country",           limit: 255
    t.integer  "zipcode",           limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "prize_id",          limit: 4
    t.text     "first_last_name",   limit: 65535
    t.text     "phone_number",      limit: 65535
    t.text     "address_continued", limit: 65535
    t.string   "user_email",        limit: 255
  end

  create_table "prizes", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "price",                  limit: 4
    t.integer  "is_in_stock",            limit: 4
    t.integer  "in_stock",               limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "thumbnail_file_name",    limit: 255
    t.string   "thumbnail_content_type", limit: 255
    t.integer  "thumbnail_file_size",    limit: 4
    t.datetime "thumbnail_updated_at"
    t.integer  "exp_price",              limit: 4
    t.integer  "level_needed",           limit: 4
    t.text     "description",            limit: 65535
  end

  create_table "user_bets", force: :cascade do |t|
    t.integer  "bet_on_id",      limit: 4
    t.integer  "bet_points",     limit: 4
    t.integer  "bet_team",       limit: 4, default: 0
    t.integer  "won",            limit: 4, default: 0
    t.integer  "loss",           limit: 4, default: 0
    t.integer  "returned_value", limit: 4, default: 0
    t.integer  "closed",         limit: 4, default: 0
    t.integer  "user_id",        limit: 4
    t.integer  "bet_id",         limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "exp_change",     limit: 4
  end

  add_index "user_bets", ["bet_id"], name: "index_user_bets_on_bet_id", using: :btree
  add_index "user_bets", ["user_id"], name: "index_user_bets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255
    t.integer  "points",                 limit: 4,   default: 0
    t.integer  "all_bets",               limit: 4,   default: 0
    t.integer  "won_bets",               limit: 4,   default: 0
    t.integer  "lost_bets",              limit: 4,   default: 0
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "level",                  limit: 4,   default: 1
    t.integer  "experience",             limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "user_bets", "bets"
  add_foreign_key "user_bets", "users"
end
