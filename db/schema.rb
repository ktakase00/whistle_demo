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

ActiveRecord::Schema.define(version: 2018_12_02_084308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "milestone_reports", force: :cascade do |t|
    t.bigint "milestone_id", default: 0, null: false
    t.datetime "report_at", null: false
    t.text "status_cd", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.bigint "project_id", default: 0, null: false
    t.text "milestone_nm", default: "", null: false
    t.datetime "schedule_at", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_reports", force: :cascade do |t|
    t.bigint "project_id", default: 0, null: false
    t.datetime "report_at", null: false
    t.text "status_cd", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.text "project_nm", default: "", null: false
    t.datetime "start_at"
    t.datetime "release_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
