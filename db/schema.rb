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

ActiveRecord::Schema[8.0].define(version: 2024_11_27_011905) do
  create_table "card_attempts", force: :cascade do |t|
    t.decimal "score"
    t.integer "flash_card_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flash_card_id"], name: "index_card_attempts_on_flash_card_id"
    t.index ["user_id"], name: "index_card_attempts_on_user_id"
  end

  create_table "flash_card_answers", force: :cascade do |t|
    t.integer "flash_card_id", null: false
    t.string "value"
    t.text "explanation"
    t.boolean "correct", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flash_card_id"], name: "index_flash_card_answers_on_flash_card_id"
  end

  create_table "flash_cards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "topic_id", null: false
    t.string "type", default: "HiddenAnswerFlashCard", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_flash_cards_on_topic_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_masteries", force: :cascade do |t|
    t.integer "topic_id", null: false
    t.date "last_studied"
    t.integer "user_id", null: false
    t.decimal "mastery_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topic_masteries_on_topic_id"
    t.index ["user_id"], name: "index_topic_masteries_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "explanation"
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_topics_on_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "card_attempts", "flash_cards"
  add_foreign_key "card_attempts", "users"
  add_foreign_key "flash_card_answers", "flash_cards"
  add_foreign_key "flash_cards", "topics"
  add_foreign_key "sessions", "users"
  add_foreign_key "topic_masteries", "topics"
  add_foreign_key "topic_masteries", "users"
  add_foreign_key "topics", "subjects"
end
