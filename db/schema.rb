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

ActiveRecord::Schema.define(version: 20170616130145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.bigint "body_style_id"
    t.bigint "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["body_style_id"], name: "index_cars_on_body_style_id"
    t.index ["make_id"], name: "index_cars_on_make_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_dealers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_dealers_on_reset_password_token", unique: true
  end

  create_table "dealers_dealerships", force: :cascade do |t|
    t.bigint "dealer_id"
    t.bigint "dealership_id"
    t.index ["dealer_id"], name: "index_dealers_dealerships_on_dealer_id"
    t.index ["dealership_id"], name: "index_dealers_dealerships_on_dealership_id"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.string "logo"
    t.string "short_name"
    t.string "phone"
    t.string "email"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_dealerships_on_admin_id", unique: true
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "models", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "dealership_id"
    t.integer "year"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_models_on_car_id"
    t.index ["dealership_id"], name: "index_models_on_dealership_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.json "image"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "makes"
  add_foreign_key "models", "cars"
  add_foreign_key "models", "dealerships"
end
