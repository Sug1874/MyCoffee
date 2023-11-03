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

ActiveRecord::Schema[7.0].define(version: 2023_10_26_092957) do
  create_table "areas", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_areas_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.integer "bitterness", default: 1
    t.integer "acidity", default: 1
    t.integer "body", default: 1
    t.string "roast"
    t.string "variety"
    t.string "process"
    t.string "farm"
    t.text "shop_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_items_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "tastes", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "taste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tastes_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "areas", "items"
  add_foreign_key "items", "users"
  add_foreign_key "tastes", "items"
end
