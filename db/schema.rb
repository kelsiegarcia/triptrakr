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

ActiveRecord::Schema.define(version: 20160526200550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["location_id"], name: "index_addresses_on_location_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["location_id"], name: "index_items_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "activity"
    t.integer  "trip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["trip_id"], name: "index_locations_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.date     "date_beginning"
    t.date     "date_end"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "addresses", "locations"
  add_foreign_key "items", "locations"
  add_foreign_key "locations", "trips"
end