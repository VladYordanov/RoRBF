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

ActiveRecord::Schema.define(version: 20150909143843) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "bets", force: :cascade do |t|
    t.string   "team_one"
    t.string   "team_two"
    t.integer  "team_one_chance",  default: 50
    t.integer  "team_two_chance",  default: 50
    t.integer  "team_one_value",   default: 1
    t.integer  "team_two_value",   default: 1
    t.integer  "winner"
    t.integer  "bets_on_team_one", default: 0
    t.integer  "bets_on_team_two", default: 0
    t.integer  "can_bet",          default: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "match_starts_at"
  end

  create_table "user_bets", force: :cascade do |t|
    t.integer  "bet_on_id"
    t.integer  "bet_points"
    t.integer  "bet_team",       default: 0
    t.integer  "won",            default: 0
    t.integer  "loss",           default: 0
    t.integer  "returned_value", default: 0
    t.integer  "closed",         default: 0
    t.integer  "user_id"
    t.integer  "bet_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_bets", ["bet_id"], name: "index_user_bets_on_bet_id"
  add_index "user_bets", ["user_id"], name: "index_user_bets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "points",                 default: 0
    t.integer  "all_bets",               default: 0
    t.integer  "won_bets",               default: 0
    t.integer  "lost_bets",              default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
