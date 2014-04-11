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

ActiveRecord::Schema.define(version: 20140411155736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "action_card", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string "type"
    t.string "name"
  end

  create_table "action_log", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string "type"
    t.uuid   "actor",    null: false
    t.uuid   "receiver"
  end

  create_table "card_in_pile", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string "type"
    t.uuid   "action_card_id", null: false
    t.uuid   "game_id",        null: false
  end

  add_index "card_in_pile", ["action_card_id", "game_id"], name: "index_card_in_pile_on_action_card_id_and_game_id", unique: true, using: :btree

  create_table "character_card", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string  "name",            null: false
    t.integer "max_hp",          null: false
    t.string  "allegiance"
    t.string  "special_ability"
    t.string  "win_condition"
  end

  create_table "games", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string "area_card_1",       null: false
    t.string "area_card_2",       null: false
    t.string "area_card_3",       null: false
    t.string "area_card_4",       null: false
    t.string "area_card_5",       null: false
    t.string "area_card_6",       null: false
    t.uuid   "current_player_id"
    t.string "turn_phase"
  end

  create_table "players", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid    "game_id",                           null: false
    t.uuid    "character_card_id",                 null: false
    t.integer "current_health",                    null: false
    t.string  "current_location"
    t.boolean "revealed",          default: false
    t.integer "turn_order"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "win", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid "game_id",   null: false
    t.uuid "player_id", null: false
  end

end
