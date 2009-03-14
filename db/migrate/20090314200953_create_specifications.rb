class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.integer :layout_id
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.integer :length
      t.integer :lwl
      t.integer :loa
      t.integer :beam
      t.integer :min_draft
      t.integer :max_draft
      t.integer :bridge_clearance
      t.integer :displacement
      t.integer :ballast
      t.integer :cruise_speed
      t.integer :max_speed
      t.string :hull_material
      t.string :designer
      t.integer :fuel_tank_capacity
      t.integer :water_tank_capacity
      t.integer :holding_tank_capacity
      t.integer :number_of_fuel_tanks
      t.integer :number_of_water_tanks
      t.integer :number_of_holding_tanks
      t.string :engine_manufacturer
      t.string :engine_model
      t.string :engine_fuel
      t.integer :engine_horsepower
      t.integer :engine_year
      t.integer :engine_hours
      t.integer :number_of_engines

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
