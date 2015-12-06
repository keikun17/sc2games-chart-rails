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

ActiveRecord::Schema.define(version: 20151206134423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "ms_date"
    t.string   "map"
    t.string   "decision"
    t.string   "game_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["decision"], name: "index_matches_on_decision", using: :btree
  add_index "matches", ["game_type"], name: "index_matches_on_game_type", using: :btree
  add_index "matches", ["ms_date"], name: "index_matches_on_ms_date", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "profile_id"
    t.string   "region"
    t.string   "name"
    t.string   "clan_tag"
    t.string   "primary_race"
    t.json     "portrait"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "r_id",         default: 1
  end

  add_index "profiles", ["profile_id"], name: "index_profiles_on_profile_id", using: :btree

end
