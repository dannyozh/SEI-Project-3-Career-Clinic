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

ActiveRecord::Schema.define(version: 2019_11_11_080208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employers", force: :cascade do |t|
    t.string "company_name"
    t.text "contact"
    t.string "industry"
    t.text "duration"
    t.text "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "environments", force: :cascade do |t|
    t.text "work_space"
    t.text "hours"
    t.text "team_size"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "explorers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_explorers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_explorers_on_reset_password_token", unique: true
  end

  create_table "explorers_listings", force: :cascade do |t|
    t.bigint "explorer_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["explorer_id"], name: "index_explorers_listings_on_explorer_id"
    t.index ["listing_id"], name: "index_explorers_listings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "employer_id"
    t.bigint "trait_id"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_listings_on_employer_id"
    t.index ["environment_id"], name: "index_listings_on_environment_id"
    t.index ["trait_id"], name: "index_listings_on_trait_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
