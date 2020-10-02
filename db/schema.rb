# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_02_024841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_days", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_available_days_on_date", unique: true
  end

  create_table "available_days_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "available_day_id", null: false
  end

  create_table "collaborations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id", null: false
    t.string "role"
    t.integer "meal_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_collaborations_on_team_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "province_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_departments_on_province_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "reference_name"
    t.integer "meal_quantity"
    t.bigint "locality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.index ["locality_id"], name: "index_destinations_on_locality_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "name"
    t.integer "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_localities_on_department_id"
  end

  create_table "localities_zones", id: false, force: :cascade do |t|
    t.bigint "zone_id", null: false
    t.bigint "locality_id", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_destinations", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "destination_id", null: false
    t.integer "meal_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_id"], name: "index_team_destinations_on_destination_id"
    t.index ["team_id"], name: "index_team_destinations_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.date "pick_up_date"
    t.text "notes"
    t.boolean "final", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "intermediate_destination"
    t.string "pick_up_time_range"
    t.datetime "pick_up_email_sent_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "phone"
    t.integer "locality_id", null: false
    t.bigint "roles", default: 0, null: false
    t.integer "status", default: 0
    t.string "quick_edit_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["locality_id"], name: "index_users_on_locality_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "collaborations", "teams"
  add_foreign_key "collaborations", "users", on_delete: :nullify
  add_foreign_key "departments", "provinces"
  add_foreign_key "destinations", "localities"
  add_foreign_key "localities", "departments"
  add_foreign_key "team_destinations", "destinations"
  add_foreign_key "team_destinations", "teams"
  add_foreign_key "users", "localities"
end
