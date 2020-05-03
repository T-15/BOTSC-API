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

ActiveRecord::Schema.define(version: 20200502201938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "constitution_articles", force: :cascade do |t|
    t.integer "position"
    t.string "title", default: "", null: false
    t.string "content", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "constitution_by_laws", force: :cascade do |t|
    t.integer "position"
    t.string "title", default: "", null: false
    t.string "content", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "member_id"
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_contacts_on_member_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "season_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_divisions_on_season_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "google_maps_url", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "field_id"
    t.bigint "status_id"
    t.integer "week", default: 0, null: false
    t.date "date"
    t.time "time"
    t.integer "home_score"
    t.integer "away_score"
    t.string "additional_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["field_id"], name: "index_matches_on_field_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["status_id"], name: "index_matches_on_status_id"
  end

  create_table "member_positions", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_positions_on_member_id"
    t.index ["position_id"], name: "index_member_positions_on_position_id"
  end

  create_table "member_services", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "contact_name", default: "", null: false
    t.string "description", default: ""
    t.string "image", default: ""
    t.string "website_url", default: ""
    t.string "facebook_url", default: ""
    t.string "twitter_url", default: ""
    t.string "instagram_url", default: ""
    t.string "email", default: ""
    t.string "phone", default: ""
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.bigint "status_id"
    t.bigint "shirt_size_id"
    t.bigint "short_size_id"
    t.bigint "referral_method_id"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "birthday", null: false
    t.string "phone", default: ""
    t.string "email", default: ""
    t.string "postal_code", default: ""
    t.string "image", default: "", null: false
    t.integer "member_since", null: false
    t.boolean "deceased", default: false, null: false
    t.date "deceased_date"
    t.boolean "masters_eligible", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referral_method_id"], name: "index_members_on_referral_method_id"
    t.index ["shirt_size_id"], name: "index_members_on_shirt_size_id"
    t.index ["short_size_id"], name: "index_members_on_short_size_id"
    t.index ["status_id"], name: "index_members_on_status_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "member_id"
    t.string "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_notes_on_member_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referral_methods", force: :cascade do |t|
    t.string "name", default: "t", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year", default: 0, null: false
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "image", default: ""
    t.string "website_url", default: ""
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_team_members_on_member_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "convenor_id"
    t.bigint "division_id"
    t.bigint "sponsor_id"
    t.string "name", default: "", null: false
    t.string "jersey_image"
    t.string "team_image"
    t.integer "draft_position", default: 0
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convenor_id"], name: "index_teams_on_convenor_id"
    t.index ["division_id"], name: "index_teams_on_division_id"
    t.index ["sponsor_id"], name: "index_teams_on_sponsor_id"
  end

  create_table "waiting_list_members", force: :cascade do |t|
    t.bigint "waiting_list_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_waiting_list_members_on_member_id"
    t.index ["waiting_list_id"], name: "index_waiting_list_members_on_waiting_list_id"
  end

  create_table "waiting_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_waiting_lists_on_division_id"
  end

  add_foreign_key "divisions", "seasons"
  add_foreign_key "matches", "fields"
  add_foreign_key "matches", "statuses"
  add_foreign_key "member_positions", "members"
  add_foreign_key "member_positions", "positions"
  add_foreign_key "notes", "members"
  add_foreign_key "waiting_list_members", "members"
  add_foreign_key "waiting_list_members", "waiting_lists"
  add_foreign_key "waiting_lists", "divisions"
end
