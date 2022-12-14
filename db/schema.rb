# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_11_124928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yb_serial"
    t.string "yb_marker"
    t.index ["race_id"], name: "index_boats_on_race_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "gps_at"
    t.string "latitude"
    t.string "longitude"
    t.string "altitude"
    t.string "sog"
    t.string "cog"
    t.string "battery"
    t.string "yb_id"
    t.string "temperature"
    t.string "tx_at"
    t.bigint "boat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_positions_on_boat_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  add_foreign_key "boats", "races"
  add_foreign_key "positions", "boats"
end
