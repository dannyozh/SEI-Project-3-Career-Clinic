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

ActiveRecord::Schema.define(version: 2019_11_13_063816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "employers_profiles", force: :cascade do |t|
    t.string "company_name"
    t.string "company_logo"
    t.bigint "employer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_employers_profiles_on_employer_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environments_listings", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_id"], name: "index_environments_listings_on_environment_id"
    t.index ["listing_id"], name: "index_environments_listings_on_listing_id"
  end

  create_table "explorers", force: :cascade do |t|
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

  create_table "explorers_profiles", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "photo_url"
    t.bigint "explorer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["explorer_id"], name: "index_explorers_profiles_on_explorer_id"
  end

  create_table "explorers_profiles_listings", force: :cascade do |t|
    t.bigint "explorer_profile_id"
    t.bigint "listing_id"
    t.boolean "connect", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["explorer_profile_id"], name: "index_explorers_profiles_listings_on_explorer_profile_id"
    t.index ["listing_id"], name: "index_explorers_profiles_listings_on_listing_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries_listings", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_industries_listings_on_industry_id"
    t.index ["listing_id"], name: "index_industries_listings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "job_title"
    t.bigint "employer_profile_id"
    t.string "photo_url"
    t.text "duration"
    t.text "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_profile_id"], name: "index_listings_on_employer_profile_id"
  end

  create_table "listings_traits", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listings_traits_on_listing_id"
    t.index ["trait_id"], name: "index_listings_traits_on_trait_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traits", force: :cascade do |t|
    t.string "personality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
