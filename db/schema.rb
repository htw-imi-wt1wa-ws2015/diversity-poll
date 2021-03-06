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

ActiveRecord::Schema.define(version: 20151104231137) do

  create_table "dimensions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dimensions_in_polls", force: :cascade do |t|
    t.integer  "dimension_id"
    t.integer  "poll_id"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "dimensions_in_polls", ["dimension_id"], name: "index_dimensions_in_polls_on_dimension_id"
  add_index "dimensions_in_polls", ["poll_id"], name: "index_dimensions_in_polls_on_poll_id"

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "dimension_id"
    t.integer  "value_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "poll_id"
  end

  add_index "replies", ["dimension_id"], name: "index_replies_on_dimension_id"
  add_index "replies", ["poll_id"], name: "index_replies_on_poll_id"
  add_index "replies", ["value_id"], name: "index_replies_on_value_id"

  create_table "values", force: :cascade do |t|
    t.string   "label"
    t.integer  "dimension_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "values", ["dimension_id"], name: "index_values_on_dimension_id"

end
