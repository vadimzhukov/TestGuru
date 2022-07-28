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

ActiveRecord::Schema.define(version: 2022_07_28_141455) do

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "correct", default: false
    t.integer "answers_id"
    t.integer "questions_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answers_id"], name: "index_answers_on_answers_id"
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.integer "questions_id"
    t.integer "tests_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questions_id"], name: "index_questions_on_questions_id"
    t.index ["tests_id"], name: "index_questions_on_tests_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "titile", null: false
    t.integer "level", default: 0, null: false
    t.integer "tables_id"
    t.integer "categories_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_tests_on_categories_id"
    t.index ["tables_id"], name: "index_tests_on_tables_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
