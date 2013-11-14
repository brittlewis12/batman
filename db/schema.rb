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

ActiveRecord::Schema.define(version: 20131114171450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", force: true do |t|
    t.string   "name",       null: false
    t.integer  "creator_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["creator_id"], name: "index_songs_on_creator_id", using: :btree

  create_table "songs_users", id: false, force: true do |t|
    t.integer "song_id", null: false
    t.integer "user_id", null: false
  end

  add_index "songs_users", ["song_id"], name: "index_songs_users_on_song_id", using: :btree
  add_index "songs_users", ["user_id"], name: "index_songs_users_on_user_id", using: :btree

  create_table "tracks", force: true do |t|
    t.string   "name",                       null: false
    t.string   "url",                        null: false
    t.boolean  "active",     default: true
    t.float    "volume",     default: 1.0
    t.float    "offset",     default: 0.0
    t.integer  "loop",       default: 1
    t.integer  "song_id",                    null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
    t.boolean  "removed",    default: false
  end

  add_index "tracks", ["song_id"], name: "index_tracks_on_song_id", using: :btree
  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
