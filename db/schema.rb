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

ActiveRecord::Schema[7.0].define(version: 2022_03_26_062646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entry_points", force: :cascade do |t|
    t.string "name", null: false
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "unique_entry_point", unique: true
  end

  create_table "parking_slots", force: :cascade do |t|
    t.string "slot_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slot_bookings", force: :cascade do |t|
    t.string "vehicle_reg_no", null: false
    t.string "name"
    t.bigint "entry_point_id"
    t.bigint "parking_slot_id"
    t.datetime "booked_at", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "duration_in_hrs", default: 1, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiry_at"
    t.index ["entry_point_id"], name: "index_slot_bookings_on_entry_point_id"
    t.index ["parking_slot_id"], name: "index_slot_bookings_on_parking_slot_id"
  end

  create_table "slot_distance_details", force: :cascade do |t|
    t.bigint "entry_point_id"
    t.bigint "parking_slot_id"
    t.decimal "distance_in_mtr", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_point_id"], name: "index_slot_distance_details_on_entry_point_id"
    t.index ["parking_slot_id"], name: "index_slot_distance_details_on_parking_slot_id"
  end

  add_foreign_key "slot_bookings", "entry_points"
  add_foreign_key "slot_bookings", "parking_slots"
  add_foreign_key "slot_distance_details", "entry_points"
  add_foreign_key "slot_distance_details", "parking_slots"
end
