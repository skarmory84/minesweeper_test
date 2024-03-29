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

ActiveRecord::Schema.define(version: 2021_11_01_075412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "minefields", force: :cascade do |t|
    t.string "uuid"
    t.integer "x_size"
    t.integer "y_size"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mines_number"
    t.integer "found_spaces"
  end

  create_table "squares", force: :cascade do |t|
    t.bigint "minefield_id"
    t.integer "x_position"
    t.integer "y_position"
    t.integer "visibility_status"
    t.integer "asociated_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minefield_id"], name: "index_squares_on_minefield_id"
  end

  add_foreign_key "squares", "minefields"
end
