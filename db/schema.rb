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

ActiveRecord::Schema[7.0].define(version: 2022_09_28_164320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer "score1"
    t.integer "score2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team1"
    t.integer "team2"
    t.bigint "games_id"
    t.bigint "users_id"
    t.index ["games_id"], name: "index_boards_on_games_id"
    t.index ["users_id"], name: "index_boards_on_users_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "game_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phases_id"
    t.index ["phases_id"], name: "index_games_on_phases_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "games", column: "games_id"
  add_foreign_key "boards", "teams", column: "team1"
  add_foreign_key "boards", "teams", column: "team2"
  add_foreign_key "boards", "users", column: "users_id"
  add_foreign_key "games", "phases", column: "phases_id"
end
