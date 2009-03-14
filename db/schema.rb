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

ActiveRecord::Schema.define(:version => 20090314200953) do

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
    t.integer  "layout_id"
    t.string   "manufacturer"
    t.string   "model"
    t.integer  "year"
    t.integer  "length"
    t.integer  "lwl"
    t.integer  "loa"
    t.integer  "beam"
    t.integer  "min_draft"
    t.integer  "max_draft"
    t.integer  "bridge_clearance"
    t.integer  "displacement"
    t.integer  "ballast"
    t.integer  "cruise_speed"
    t.integer  "max_speed"
    t.string   "hull_material"
    t.string   "designer"
    t.integer  "fuel_tank_capacity"
    t.integer  "water_tank_capacity"
    t.integer  "holding_tank_capacity"
    t.integer  "number_of_fuel_tanks"
    t.integer  "number_of_water_tanks"
    t.integer  "number_of_holding_tanks"
    t.string   "engine_manufacturer"
    t.string   "engine_model"
    t.string   "engine_fuel"
    t.integer  "engine_horsepower"
    t.integer  "engine_year"
    t.integer  "engine_hours"
    t.integer  "number_of_engines"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
