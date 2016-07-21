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

ActiveRecord::Schema.define(version: 20160712105907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grant_details", force: :cascade do |t|
    t.string   "forename"
    t.string   "surname"
    t.string   "work_number"
    t.string   "mobile_number"
    t.integer  "employment_sector"
    t.string   "company_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "town_name"
    t.string   "county"
    t.string   "postcode"
    t.string   "learner_name"
    t.string   "learner_dob"
    t.string   "apprentice_start_date"
    t.integer  "training_provider"
    t.string   "bank_name"
    t.string   "account_number"
    t.string   "sort_code"
    t.string   "signature"
    t.integer  "user_id"
    t.integer  "title"
    t.boolean  "reminder_email_sent",      default: false
    t.boolean  "no_review_15_weeks_email", default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "grant_reviews", force: :cascade do |t|
    t.string   "file"
    t.integer  "grant_detail_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "body"
    t.string   "name"
    t.string   "url_alias"
    t.boolean  "home"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "admin",             default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
