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

ActiveRecord::Schema.define(version: 20180418121140) do

  create_table "artists", force: :cascade do |t|
    t.text "artist"
    t.integer "switch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dizzies", force: :cascade do |t|
    t.text "music"
    t.text "kasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.text "title"
    t.text "kasi"
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.boolean "disp_flg"
    t.datetime "start"
    t.datetime "end"
    t.string "allDay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
