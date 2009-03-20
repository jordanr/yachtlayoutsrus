# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 99990320193036) do

  create_table "photos", :force => true do |t|
    t.integer  "specification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "specifications", :force => true do |t|
    t.string   "manufacturer"
    t.string   "model"
    t.integer  "year"
    t.integer  "length"
    t.string   "lwl"
    t.string   "loa"
    t.string   "lod"
    t.string   "beam"
    t.string   "min_draft"
    t.string   "max_draft"
    t.string   "bridge_clearance"
    t.string   "displacement"
    t.string   "ballast"
    t.string   "cruise_speed"
    t.string   "max_speed"
    t.string   "hull_material"
    t.string   "designer"
    t.string   "fuel_tanks"
    t.string   "water_tanks"
    t.string   "holding_tanks"
    t.string   "engine_manufacturer"
    t.string   "engine_model"
    t.string   "engine_fuel"
    t.string   "engine_horsepower"
    t.integer  "engine_year"
    t.integer  "number_of_engines"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "trigrams", :force => true do |t|
    t.integer  "score"
    t.integer  "specification_id"
    t.string   "tg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
