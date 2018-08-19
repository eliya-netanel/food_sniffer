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

ActiveRecord::Schema.define(version: 2018_08_19_142624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diet_ingredients", force: :cascade do |t|
    t.bigint "diet_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diet_id"], name: "index_diet_ingredients_on_diet_id"
    t.index ["ingredient_id"], name: "index_diet_ingredients_on_ingredient_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "food_item_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "food_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_food_item_ingredients_on_food_item_id"
    t.index ["ingredient_id"], name: "index_food_item_ingredients_on_ingredient_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "food_item_id"
    t.string "date"
    t.boolean "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_scans_on_food_item_id"
    t.index ["user_id"], name: "index_scans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diet_ingredients", "diets"
  add_foreign_key "diet_ingredients", "ingredients"
  add_foreign_key "diets", "users"
  add_foreign_key "food_item_ingredients", "food_items"
  add_foreign_key "food_item_ingredients", "ingredients"
  add_foreign_key "scans", "food_items"
  add_foreign_key "scans", "users"
end
