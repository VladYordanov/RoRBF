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

ActiveRecord::Schema.define(version: 20150829173454) do

  create_table "bets", force: :cascade do |t|
    t.string   "team_one"
    t.string   "team_two"
    t.integer  "team_one_chance"
    t.integer  "team_two_chance"
    t.integer  "team_one_value"
    t.integer  "team_two_value"
    t.integer  "winner"
    t.integer  "bets_on_team_one"
    t.integer  "bets_on_team_two"
    t.integer  "can_bet"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.string   "password"
    t.integer  "points"
    t.integer  "all_bets"
    t.integer  "curr_bets"
    t.integer  "won_bets"
    t.integer  "lost_bets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
