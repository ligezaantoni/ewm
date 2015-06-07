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

ActiveRecord::Schema.define(version: 20150607141103) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "level",        default: 0
    t.text     "requirements"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "abilities_scouts", id: false, force: :cascade do |t|
    t.integer "ability_id"
    t.integer "scout_id"
  end

  add_index "abilities_scouts", ["ability_id"], name: "index_abilities_scouts_on_ability_id"
  add_index "abilities_scouts", ["scout_id"], name: "index_abilities_scouts_on_scout_id"

  create_table "activities", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "activity_form_id"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.time     "estimated_time"
  end

  add_index "activities", ["activity_form_id"], name: "index_activities_on_activity_form_id"
  add_index "activities", ["event_id"], name: "index_activities_on_event_id"

  create_table "activity_forms", force: :cascade do |t|
    t.integer  "educational_method_id"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
  end

  add_index "activity_forms", ["educational_method_id"], name: "index_activity_forms_on_educational_method_id"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_and_number"
    t.string   "postal_code"
    t.string   "city"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

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

  create_table "educational_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "starts_at"
    t.string   "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id"

  create_table "execution_reports", force: :cascade do |t|
    t.integer  "activity_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "execution_reports", ["activity_id"], name: "index_execution_reports_on_activity_id"

  create_table "methods_traits", id: false, force: :cascade do |t|
    t.integer "educational_method_id"
    t.integer "character_trait_id"
  end

  add_index "methods_traits", ["character_trait_id"], name: "index_methods_traits_on_character_trait_id"
  add_index "methods_traits", ["educational_method_id"], name: "index_methods_traits_on_educational_method_id"

  create_table "related_people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "role",         default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "schools", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "team_id"
    t.string   "name"
    t.integer  "number"
    t.string   "patron"
    t.boolean  "activity_room"
    t.boolean  "equipment_storage"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "schools", ["address_id"], name: "index_schools_on_address_id"
  add_index "schools", ["team_id"], name: "index_schools_on_team_id"

  create_table "schools_officials", id: false, force: :cascade do |t|
    t.integer "school_id"
    t.integer "official_id"
  end

  add_index "schools_officials", ["official_id"], name: "index_schools_officials_on_official_id"
  add_index "schools_officials", ["school_id"], name: "index_schools_officials_on_school_id"

  create_table "scouts", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "address_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "birthplace"
    t.string   "phone_number"
    t.string   "email"
    t.text     "allergies"
    t.text     "past_diseases"
    t.text     "vaccinations"
    t.integer  "rank",            default: 0
    t.integer  "position",        default: 0
    t.date     "promise_made_on"
    t.string   "patrol"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "scouts", ["address_id"], name: "index_scouts_on_address_id"
  add_index "scouts", ["team_id"], name: "index_scouts_on_team_id"

  create_table "scouts_parents", id: false, force: :cascade do |t|
    t.integer "scout_id"
    t.integer "parent_id"
  end

  add_index "scouts_parents", ["parent_id"], name: "index_scouts_parents_on_parent_id"
  add_index "scouts_parents", ["scout_id"], name: "index_scouts_parents_on_scout_id"

  create_table "teams", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "name"
    t.integer  "number"
    t.string   "patron"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "region"
    t.integer  "kind",       default: 0
    t.boolean  "trial"
  end

  add_index "teams", ["address_id"], name: "index_teams_on_address_id"

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
