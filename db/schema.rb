# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150913171432) do

  create_table "activities", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.integer  "estimated_time"
    t.integer  "position"
  end

  add_index "activities", ["event_id"], name: "index_activities_on_event_id"

  create_table "activity_forms", force: :cascade do |t|
    t.integer  "educational_method_id"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
  end

  add_index "activity_forms", ["educational_method_id"], name: "index_activity_forms_on_educational_method_id"

  create_table "activity_forms_activities", id: false, force: :cascade do |t|
    t.integer "activity_form_id"
    t.integer "activity_id"
  end

  add_index "activity_forms_activities", ["activity_form_id"], name: "index_activity_forms_activities_on_activity_form_id"
  add_index "activity_forms_activities", ["activity_id"], name: "index_activity_forms_activities_on_activity_id"

  create_table "activity_forms_traits", id: false, force: :cascade do |t|
    t.integer "activity_form_id"
    t.integer "character_trait_id"
  end

  add_index "activity_forms_traits", ["activity_form_id"], name: "index_activity_forms_traits_on_activity_form_id"
  add_index "activity_forms_traits", ["character_trait_id"], name: "index_activity_forms_traits_on_character_trait_id"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_and_number"
    t.string   "postal_code"
    t.string   "city"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"

  create_table "character_traits", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "character_traits_scouts", id: false, force: :cascade do |t|
    t.integer "character_trait_id"
    t.integer "scout_id"
  end

  add_index "character_traits_scouts", ["character_trait_id"], name: "index_character_traits_scouts_on_character_trait_id"
  add_index "character_traits_scouts", ["scout_id"], name: "index_character_traits_scouts_on_scout_id"

  create_table "character_traits_teams", id: false, force: :cascade do |t|
    t.integer "character_trait_id"
    t.integer "team_id"
  end

  add_index "character_traits_teams", ["character_trait_id"], name: "index_character_traits_teams_on_character_trait_id"
  add_index "character_traits_teams", ["team_id"], name: "index_character_traits_teams_on_team_id"

  create_table "educational_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "starts_at"
    t.date     "starts_on"
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id"

  create_table "execution_reports", force: :cascade do |t|
    t.integer  "activity_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "execution_reports", ["activity_id"], name: "index_execution_reports_on_activity_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "pesel"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "related_people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "role",           default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "relatable_id"
    t.string   "relatable_type"
  end

  add_index "related_people", ["relatable_type", "relatable_id"], name: "index_related_people_on_relatable_type_and_relatable_id"

  create_table "schools", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "number"
    t.string   "patron"
    t.boolean  "activity_room"
    t.boolean  "equipment_storage"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "kind"
  end

  add_index "schools", ["team_id"], name: "index_schools_on_team_id"

  create_table "scores", force: :cascade do |t|
    t.integer "scout_id"
    t.integer "number"
    t.string  "reason"
    t.integer "scorable_id"
    t.string  "scorable_type"
  end

  add_index "scores", ["scorable_type", "scorable_id"], name: "index_scores_on_scorable_type_and_scorable_id"
  add_index "scores", ["scout_id"], name: "index_scores_on_scout_id"

  create_table "scouts", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "birthplace"
    t.string   "phone_number"
    t.string   "email"
    t.text     "allergies"
    t.text     "past_diseases"
    t.text     "vaccinations"
    t.integer  "rank",                default: 0
    t.integer  "position",            default: 0
    t.date     "promise_made_on"
    t.string   "patrol"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "pesel"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "school_id"
    t.string   "grade"
  end

  add_index "scouts", ["school_id"], name: "index_scouts_on_school_id"
  add_index "scouts", ["team_id"], name: "index_scouts_on_team_id"

  create_table "tasks", force: :cascade do |t|
    t.integer "activity_form_id"
    t.date    "deadline"
    t.text    "description"
    t.integer "status"
    t.integer "taskable_id"
    t.string  "taskable_type"
    t.integer "points"
  end

  add_index "tasks", ["activity_form_id"], name: "index_tasks_on_activity_form_id"
  add_index "tasks", ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "patron"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "region"
    t.integer  "kind",       default: 0
    t.boolean  "trial"
    t.integer  "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "role",                   default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
