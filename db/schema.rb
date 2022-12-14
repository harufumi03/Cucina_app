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

ActiveRecord::Schema.define(version: 2022_12_16_020130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "select_food_prep_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["select_food_prep_id"], name: "index_comments_on_select_food_prep_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "food_prep_labels", force: :cascade do |t|
    t.bigint "food_prep_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_prep_id"], name: "index_food_prep_labels_on_food_prep_id"
    t.index ["label_id"], name: "index_food_prep_labels_on_label_id"
  end

  create_table "food_preps", force: :cascade do |t|
    t.string "name", null: false
    t.string "ingredient", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_food_preps_on_group_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "select_food_preps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "food_prep_id", null: false
    t.date "to_do_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id", null: false
    t.index ["food_prep_id"], name: "index_select_food_preps_on_food_prep_id"
    t.index ["group_id"], name: "index_select_food_preps_on_group_id"
    t.index ["user_id"], name: "index_select_food_preps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "select_food_preps"
  add_foreign_key "comments", "users"
  add_foreign_key "food_prep_labels", "food_preps"
  add_foreign_key "food_prep_labels", "labels"
  add_foreign_key "food_preps", "groups"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "select_food_preps", "food_preps"
  add_foreign_key "select_food_preps", "groups"
  add_foreign_key "select_food_preps", "users"
end
