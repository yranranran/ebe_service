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

ActiveRecord::Schema[7.0].define(version: 2022_07_07_024659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.uuid "question_id", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "authors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evidence_sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "evidence_id", null: false
    t.uuid "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evidence_id"], name: "index_evidence_sources_on_evidence_id"
    t.index ["source_id"], name: "index_evidence_sources_on_source_id"
  end

  create_table "evidences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_evidences_on_user_id"
  end

  create_table "question_evidences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "question_id", null: false
    t.uuid "evidence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evidence_id"], name: "index_question_evidences_on_evidence_id"
    t.index ["question_id"], name: "index_question_evidences_on_question_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "source_authors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "author_id", null: false
    t.uuid "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_source_authors_on_author_id"
    t.index ["source_id"], name: "index_source_authors_on_source_id"
  end

  create_table "sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "evidence_level", default: 0
    t.integer "source_type", default: 0, null: false
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(deleted_at IS NULL)"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "evidence_sources", "evidences"
  add_foreign_key "evidence_sources", "sources"
  add_foreign_key "evidences", "users"
  add_foreign_key "question_evidences", "evidences"
  add_foreign_key "question_evidences", "questions"
  add_foreign_key "questions", "users"
  add_foreign_key "source_authors", "authors"
  add_foreign_key "source_authors", "sources"
end
